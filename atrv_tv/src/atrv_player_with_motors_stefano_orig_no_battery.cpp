#include <assert.h>
#include <boost/thread.hpp>
#include <boost/lexical_cast.hpp>

#include <playerc.h>
#include <libplayerc++/playerc++.h>

#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>

#include <nav_msgs/Odometry.h>
#include <sensor_msgs/LaserScan.h>

using namespace PlayerCc;
using namespace std;

#include <ros/ros.h>



class AtrvNode {
public:
  ros::NodeHandle node_;
  ros::Publisher odom_pub_;
  ros::Publisher laser_pub;
  ros::Subscriber cmd_vel_sub;
  tf::TransformBroadcaster tf_;

  std::string tf_prefix_;

  bool publish_tf_;
  geometry_msgs::Twist cmd_vel_;

  AtrvNode() {
    mPlayer=0;

    ros::NodeHandle private_nh("~");

    std::string host_ip = "127.0.0.1";

    private_nh.getParam("host_ip", host_ip);
    private_nh.param("publish_tf", publish_tf_, true);

    tf_prefix_ = tf::getPrefixParam(node_);

    odom_pub_ = node_.advertise<nav_msgs::Odometry>("odom", 1);
    laser_pub = node_.advertise<sensor_msgs::LaserScan>("scan", 1);
    cmd_vel_sub = node_.subscribe("atrv/cmd_vel", 1, &AtrvNode::VelCmdCallback, this);

    cmd_vel_.linear.x = 0;
    cmd_vel_.linear.y = 0;
    cmd_vel_.linear.z = 0;
    cmd_vel_.angular.x = 0;
    cmd_vel_.angular.y = 0;
    cmd_vel_.angular.z = 0;
 
  }

  ~AtrvNode() {
  }

  int start() {
    try {
      mPlayer=new PlayerClient("192.168.128.12",6665);
      mPlayer->SetDataMode(PLAYER_DATAMODE_PUSH);
    } catch(PlayerError e) {
      printf("PlayerClient error\n");
      return(-1);
    }

    mPosition = new Position2dProxy(mPlayer,0);
    mLaser = new LaserProxy(mPlayer,0);
		
    mPosition->RequestGeom();
    mLaser->RequestGeom();
    mLaser->RequestConfigure();

    printf("Initializing player: Reading first packets from player...\n");
    for(int i=0;i<10;i++) while(mPlayer->Peek()) mPlayer->Read();
    printf("Initializing player: Done\n");
		
    return 0;
  }

  int stop() {
    int status = 0;
    return(status);
  }

  void doUpdate() {
    mPlayer->Read();

    if(mPosition->IsFresh()) {
      nav_msgs::Odometry odom;
      odom.pose.pose.position.x = mPosition->GetXPos();
      odom.pose.pose.position.y = mPosition->GetYPos();
      odom.pose.pose.orientation = tf::createQuaternionMsgFromYaw(mPosition->GetYaw());
      odom.twist.twist.linear.x = mPosition->GetXSpeed();
      odom.twist.twist.linear.y = mPosition->GetYSpeed();
      odom.twist.twist.angular.z = mPosition->GetYawSpeed();

      odom.header.frame_id = std::string("odom");
      odom.header.stamp.sec = (long long unsigned int) floor(mPosition->GetDataTime());
      odom.header.stamp.nsec = (long long unsigned int) ((mPosition->GetDataTime() - floor(mPosition->GetDataTime())) * 1000000000ULL);

      odom_pub_.publish(odom);

			
      if (publish_tf_) {
	tf_.sendTransform(
			  tf::StampedTransform(
					       tf::Transform(
							     tf::createQuaternionFromYaw(mPosition->GetYaw()),
							     tf::Point(mPosition->GetXPos(),mPosition->GetYPos(),0.0)
							     ),
					       ros::Time::now(),
					       "odom","base_footprint"
					       )
			  );
      }
      mPosition->NotFresh();

    }

    if(mLaser->IsFresh()) {
      sensor_msgs::LaserScan laser;
      //Player_Clinet::RangeArray rangerArray;
      laser.ranges.resize(mLaser->GetCount());
      laser.intensities.resize(mLaser->GetCount());
      laser.header.stamp = ros::Time::now();
      laser.header.frame_id = std::string("laser");

      laser.angle_increment = mLaser->GetScanRes();
      laser.angle_min = mLaser->GetMinAngle();
      laser.angle_max = mLaser->GetMaxAngle();
      laser.range_min = 0;
      laser.range_max = mLaser->GetMaxRange();
      laser.time_increment = 0.001;
      laser.scan_time = 0.100;
      for (uint32_t i=0;i<mLaser->GetCount();++i) {
	laser.ranges[i] = mLaser->GetRange(i);
	laser.intensities[i] = mLaser->GetIntensity(i);
      }
      laser_pub.publish(laser);

      if (publish_tf_) {
	tf_.sendTransform(
			  tf::StampedTransform(
					       tf::Transform(tf::Quaternion(0, 0, 0, 1), tf::Vector3(0.5, 0.0, 0.22)),
					       ros::Time::now(),"base_footprint","laser")
			  );
      }
			

      mLaser->NotFresh();
    }

    mPosition->SetSpeed(cmd_vel_.linear.x*.5,cmd_vel_.angular.z*.25);
    //ROS_INFO("set speed %lf %lf",cmd_vel_.linear.x*.5,cmd_vel_.angular.z*.25 );
 
  }

  void getCenter() {
    mPosition->RequestGeom();
    while(!mPosition->IsFresh()) while(mPlayer->Peek()) mPlayer->Read();
  }

  void VelCmdCallback(const geometry_msgs::Twist::ConstPtr& msg) {
    cmd_vel_.linear.x = msg->linear.x;
    cmd_vel_.angular.z = msg->angular.z;

  }

private:
  PlayerClient *mPlayer;
  Position2dProxy *mPosition;
  LaserProxy *mLaser;

  std::string odom_frame_id;

		

};

int main(int argc, char** argv) {
	unsigned long int counter;
	ros::init(argc, argv, "atrv_player_with_motors");

	AtrvNode atrv;

	ros::NodeHandle n;

	if (atrv.start() != 0) exit(-1);
	atrv.getCenter();
	while (n.ok()) {
	  ros::spinOnce();
	  if((++counter)%100==0) ROS_INFO("I'm alive %d",counter);
	  atrv.doUpdate();

	}
	atrv.stop();

	return(0);
}

