/*variable "aws_access_key" {
  sensitive = true
}
variable "aws_secret_key" {
  sensitive = true
}*/

source "amazon-ebs" "example" {
  profile         = "pod-test"
  ssh_timeout     = "200s"
  region          = "ap-south-1"
  source_ami      = "ami-07d3a50bd29811cd1" // amazon linux 2
  ssh_username    = "ec2-user"
  ami_name        = "packer nginx 2"
  instance_type   = "t2.micro"
  skip_create_ami = false

}

build {
  sources = [
    "source.amazon-ebs.example"
  ]
  provisioner "ansible" {
    playbook_file = "playbook.yaml"
  }
}
