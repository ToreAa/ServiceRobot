#include <ros/ros.h>
#include <visualization_msgs/Marker.h>

int main( int argc, char** argv )
{
  ros::init(argc, argv, "add_markers");
  ros::NodeHandle n;
  ros::Rate r(1);
  ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 1);
  int i = 0; //integer for stepping through state-machine

  while (ros::ok())
  {
    visualization_msgs::Marker marker;
    // Set the frame ID and timestamp.  See the TF tutorials for information on these.
    marker.header.frame_id = "/map";
    marker.header.stamp = ros::Time::now();

    // Set the namespace and id for this marker.  This serves to create a unique ID
    // Any marker sent with the same namespace and id will overwrite the old one
    marker.ns = "add_markers";
    marker.id = 0;

    // Set the marker type to CUBE and the orientation 
    marker.type = visualization_msgs::Marker::CUBE;
    marker.pose.orientation.x = 0.0;  
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;

    // Set the scale of the marker -- 1x1x1 here means 1m on a side
    marker.scale.x = 0.3;
    marker.scale.y = 0.3;
    marker.scale.z = 0.3;

    // Set the color -- be sure to set alpha to something non-zero!
    marker.color.r = 0.9f;
    marker.color.g = 0.2f;
    marker.color.b = 0.5f;
    marker.color.a = 0.9;

    // State-machine for the various steps
    switch (i)
    {
    case 0: // Publish the marker at the pickup zone for 5 seconds
      marker.action = visualization_msgs::Marker::ADD;
      marker.pose.position.x = -4.5;
      marker.pose.position.y = 7; 
      marker.lifetime = ros::Duration(5.0);  
      marker_pub.publish(marker);
      ros::Duration(5.0).sleep();
      i = 1;
      break;
    case 1: // Wait for 5 seconds
      marker.action = visualization_msgs::Marker::DELETE;
      ros::Duration(5.0).sleep();
      i = 2;
      break;
    case 2: // Publish the marker at the drop off zone  
      marker.action = visualization_msgs::Marker::ADD;
      marker.pose.position.x = -2;
      marker.pose.position.y = 4;
      marker.lifetime = ros::Duration(10.0);
      marker_pub.publish(marker);
      ros::Duration(10.0).sleep();
      i = 0; 
      break;
    } 

    while (marker_pub.getNumSubscribers() < 1)
    {
      if (!ros::ok())
      {
        return 0;
      }
      ROS_WARN_ONCE("Please create a subscriber to the marker");
      sleep(1);
    }

    r.sleep();
  }
}
