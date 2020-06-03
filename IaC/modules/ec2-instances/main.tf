# Terraform configuration

resource "aws_instance" "master" {
  ami           	= var.ami_id
  count 		= 1
  instance_type 	= var.instance_type
  key_name 		= var.aws_team_key_id
  iam_instance_profile  = var.iam_profile_aws
  security_groups  	= [ var.security_group_aws ]
  #subnet_id 		= "subnet-a9ab6cc2"

  tags = {
    Name = "Terraform-Test-Master",
    Inspector = "InspectorEC2InstanceLinux",
    Environment = "dev"
    #Env = var.prefix
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.key_file_path)
    host        = self.public_ip
  }

#Installing via Terraform, but in next sprint this will be used to iunstall Ansible/use playbook
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo yum -y install java-1.8.0-openjdk",
      "curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo",
      "sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key",
      "sudo yum -y install jenkins",
      "sudo systemctl start jenkins",
      "sudo systemctl status jenkins",
      "sudo systemctl enable jenkins",
      "sudo amazon-linux-extras install -y docker",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user",
      "sudo systemctl status docker",
      "sudo systemctl enable docker"
    ]
  }
}


