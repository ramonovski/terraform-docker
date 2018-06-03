variable "access_key" {}
variable "secret_key" {}
variable "instance_type" {}
variable "region" {
	default	= "us-east-1"
}
variable "ami" {
	default = {
		us-east-1	= "ami-620d981d" # Debian Stretch
		#us-east-1	= "ami-a4dc46db" # Ubuntu 16.04
	}
}

