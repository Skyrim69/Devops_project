#!/bin/bash

# Define your config variables
Image_ID="ami-01a00762f46d584a1"
Instance_Type="t3.micro"
REGION="ap-south-1"
kEY_name="keypem"
Security_Group="sg-0b3677485fd9aaf40"
Instance_Name="Jenkins_Instance"

echo "Launching ec2 Instance"

# Run the AWS CLI command to launch the instance
OUTPUT=$(aws ec2 run-instances \
		--instance-type $Instance_Type \
		--image-id $Image_ID \
		--region $REGION\
		--key-name $kEY_name \
		--security-group-ids $Security_Group \
		--tag-specifications "ResourceType=instance, Tags=[{Key=NAME, Value = $Instance_Name}]" \
		--output text)
		

