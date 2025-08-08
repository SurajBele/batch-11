terraform {
    backend "s3" {
        bucket = "batch-11-terraform"
        region = "us-east-1"
        key = "terraform.tfstate" 
    }
}
provider "aws" {
  region = "us-east-1"
}
provider "google" {
  project     = "my-project-id"
  region      = "us-central1"
}
resource "aws_instance" "myinstance" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids = [aws_security_group.terra-sg.id]
    tags = {
      Name = "spider-terraform"
      env = "devops"
    } 
}
resource "google_service_account" "default" {
  account_id   = "my-custom-sa"
  display_name = "Custom SA for VM Instance"
}

resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
resource "aws_security_group" "terra-sg" {
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "TCP"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terra-sg"
  }
}

variable "instance_type" {
  default = "t2.micro"
}
variable "ami" {
  default = "ami-020cba7c55df1f615"
}
variable "region" {
  default = "us-east-1"
}

variable "key_pair"{
    default = "test"
}

output "instance_public_ip" {
  value = aws_instance.myinstance.public_ip
}