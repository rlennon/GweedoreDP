### AWS Performance Management services Notes
#### AWS CloudWatch
Amazon CloudWatch is a monitoring and observability service built to provide data and actionable insights to monitor applications and respond to system-wide performance changes, optimize resource utilization and get a unified view of operational health.
+ CloudWatch natively integrates with Amazon EC2 and automatically publishes detailed 1-minute metrics and custom metrics with up to 1-second granularity to dive deep into the logs for additional context
##### Usecases:
+ Can create an event rule to indicate state of EC2 instance
+ Can start Amazon EC2 Auto Scaling automatically, or stop an instance to reduce billing overages.
+ Use CloudWatch Events for serverless to trigger workflows with services like AWS Lambda, Amazon SNS, and AWS CloudFormation

#### AWS Auto Scaling for scaling up or scaling down EC2 instance
	TODO:
    Create VPC (need to choose subnets correctly)
	Create Elastic Load Balancing (need to configure public ELB for private EC2 instance)
	Launch Configuration (define sclaing policies to add or remove instances)
	Create Auto Scaling group (Pass ELB ID and Launch Configuration ID to Auto scaling group)

##### Amazon CloudWatch pricing

| Free tier Offering  |       | 
|:----------|:-------------|
| Metrics | Basic Monitoring Metrics (at 5-minute frequency) |
|		  | 10 Detailed Monitoring Metrics (at 1-minute frequency)|
|         | 1 Million API requests (not applicable to GetMetricData and GetMetricWidgetImage) | 
| Dashboard |    3 Dashboards for up to 50 metrics per month   |  
| Alarms | 10 Alarm metrics (not applicable to high-resolution alarms) | 
| Logs | 5GB Data (ingestion, archive storage, and data scanned by Logs Insights queries) | 
| Events |All events except custom events are included | 
| Contributor Insights |A1 Contributor Insights rule per month | 
| |The first one million log events that match the rule per month | 
| Synthetics |100 canary runs per month | 

</br>

##### References:
* <a href="https://aws.amazon.com/cloudwatch/getting-started/">AWS CloudWatch Getting Started</a>
* <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html">AWS EC2 Auto Scaling</a>
* <a href="https://aws.amazon.com/blogs/aws/new-ec2-auto-scaling-groups-with-multiple-instance-types-purchase-options/">EC2 Auto Scaling Groups With Multiple Instance Types and Purchase Options</a>


