#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/Quaternion.h>


void odomCallback(   const nav_msgs::Odometry::ConstPtr& msg){
  static tf::TransformBroadcaster br;

  br.sendTransform(
	tf::StampedTransform(
		tf::Transform(
	tf::Quaternion(msg->pose.pose.orientation.x,msg->pose.pose.orientation.y,msg->pose.pose.orientation.z,msg->pose.pose.orientation.w),
	tf::Point(msg->pose.pose.position.x,msg->pose.pose.position.y,0.0)
		),
		ros::Time::now(),
		"odom","base_link"
	)
  );
}

int main(int argc, char** argv){
  ros::init(argc, argv, "atrv_tf_broadcaster");

  ros::NodeHandle node;
  ros::Subscriber sub = node.subscribe("odom", 10, &odomCallback);

  ros::spin();
  return 0;
};


