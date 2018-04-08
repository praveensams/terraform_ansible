resource "aws_instance" "web" {
  ami           = "ami-d874e0a0"
  instance_type =  "t2.micro"
  availability_zone = "us-west-2a"
  key_name = "praveen"

  network_interface {
     network_interface_id = "${aws_network_interface.net.id}"
     device_index = 0
  }


 provisioner "local-exec" {
    command = "echo ${aws_instance.web.public_ip} > inventory &&  ansible-playbook -i inventory play.yml  -e 'ansible_ssh_private_key_file=praveen.pem'"
  }


}
    
resource "aws_network_interface" "net" {
  subnet_id = "subnet-49bed32d"
  security_groups = ["sg-02e3527c"]
  }

resource "aws_eip" "ip" {
    instance = "${aws_instance.web.id}"
}

