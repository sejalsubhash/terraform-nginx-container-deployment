output "vpc_id" {
    value = aws_vpc.my_vpc.id
}

output "instnce_id" {
    value = aws_instance.my_instance.id
}

output "public_ip" {
    value = aws_instance.my_instance.public_ip
}

output "private_dns" {
    value = aws_instance.my_instance.private_dns
  
}