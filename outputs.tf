output "ip" {
  value = "${aws_instance.test.*.public_ip}"
}

output "elb address" {
  value = "${aws_elb.test.dns_name}"
}
