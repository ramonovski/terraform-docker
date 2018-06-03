provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region		= "${var.region}"
}	

resource "aws_instance" "test" { 
	ami		= "${lookup(var.ami, var.region)}"
	instance_type	= "${var.instance_type}"

	tags { 
		Name 	= "Test instance"
	}

	user_data = "${file("files/docker.sh")}"
}

resource "aws_elb" "test" {
	name = "elbtest"
	availability_zones = [ 
		"us-east-1a", 
		"us-east-1d"
	]

	listener {
		instance_port		= 80
		instance_protocol 	= "http"
		lb_port			= 80
		lb_protocol		= "http"
	}

	health_check {
		healthy_threshold   = 2
		unhealthy_threshold = 2
		timeout             = 3
		target              = "HTTP:80/"
		interval            = 30
	}

	instances                   = ["${aws_instance.test.id}"]
	cross_zone_load_balancing   = true
	idle_timeout                = 400
	connection_draining         = true
	connection_draining_timeout = 400

	tags {
		Name = "ELB Test"
	}
}
