output "public_ip" {
  value       = aws_instance.laravel.public_ip
  description = "This is public IP of the EC2 instance"
}

output "ssh_command" {
  value       = "ssh -i ~/.ssh/laravel-key ec2-user@${aws_instance.laravel.public_ip}"
  description = "SSH command to connect to instance"
}