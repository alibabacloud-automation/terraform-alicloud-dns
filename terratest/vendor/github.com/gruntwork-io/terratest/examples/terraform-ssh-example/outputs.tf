output "public_instance_id" {
  value = "${aws_instance.example_public.id}"
}

output "public_instance_ip" {
  value = "${aws_instance.example_public.public_ip}"
}

output "private_instance_id" {
  value = "${aws_instance.example_public.id}"
}

output "private_instance_ip" {
  value = "${aws_instance.example_public.private_ip}"
}
