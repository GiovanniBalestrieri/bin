#include <ros/ros.h>
#include<geometry_msgs/Twist.h>
#include <sensor_msgs/Joy.h>

ros::Publisher vel_pub_ ;
ros::Subscriber joy_sub_;

geometry_msgs::Twist cmdvel_;

void stopRobot()
{
    cmdvel_.linear.x = 0.0;
    cmdvel_.angular.z = 0.0;
    vel_pub_.publish(cmdvel_);
}

void joyCallback(const sensor_msgs::Joy::ConstPtr& joy)
{
  geometry_msgs::Twist t;

  if(joy->buttons[4]){
    stopRobot();
    //ROS_INFO("ATRV STOPPED !!!");
    //exit(0);	

  }else{
    cmdvel_.linear.x = joy->axes[1];
    cmdvel_.angular.z = joy->axes[0];
  }

   vel_pub_.publish(cmdvel_);

}



int main(int argc, char** argv)
{
  ros::init(argc, argv, "joy_teleop_atrv");
 
  ros::NodeHandle nh_;
            
  vel_pub_ = nh_.advertise<geometry_msgs::Twist>("atrv/cmd_vel", 1);
  joy_sub_ = nh_.subscribe<sensor_msgs::Joy>("joy", 10, &joyCallback);

  
  ros::spin();
}

