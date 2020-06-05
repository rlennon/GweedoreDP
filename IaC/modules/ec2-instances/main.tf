# Terraform configuration

/*resource "aws_instance" "master" {
  ami = var.ami_id
  count = var.instance_count
  instance_type = var.instance_type
  key_name = var.aws_team_key_id
  iam_instance_profile  = var.iam_profile_aws
  security_groups	= [ var.security_group_aws ]
  #subnet_id = var.subnet_id
  tags = var.tags
  
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
      "sudo amazon-linux-extras install epel -y",
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
      #"docker pull gweedore/gweedore:32",
      #"docker run -ti --rm -p 8080:8080 gweedore/gweedore:32"
      "sudo systemctl status docker",
      "sudo systemctl enable docker",
      #"sudo yum install ansible -y"
    ]
  }
}
*/

resource "aws_instance" "webserver" {
  ami = var.ami_id
  count = var.instance_count
  instance_type = var.instance_type
  key_name = var.aws_team_key_id
  iam_instance_profile  = var.iam_profile_aws
  security_groups	= [ var.security_group_aws ]
  #subnet_id = var.subnet_id
  tags = var.tags

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.key_file_path)
    host        = self.public_ip
  }

#Installing via Terraform, but in next sprint this will be used to install Ansible/use playbook
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo yum -y install java-1.8.0-openjdk",
      "curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo",
      "sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key",
      #"sudo yum -y install jenkins",
      #"sudo systemctl start jenkins",
      #"sudo systemctl status jenkins",
      #"sudo systemctl enable jenkins",
      "sudo amazon-linux-extras install -y docker",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user",
      "sudo docker pull gweedore/gweedore:32",
      #this is the issue.  prob can run with sudo, any wat to use ec2-2 user though?  i can manuall run without sudo
      "sudo docker run -d --rm -p 8080:8080 gweedore/gweedore:32", 
      "sudo systemctl status docker",
      "sudo systemctl enable docker"
    ]
  }
}


