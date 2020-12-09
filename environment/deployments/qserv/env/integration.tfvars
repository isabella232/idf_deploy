# Project
environment             = "int"
application_name        = "qserv"
folder_id               = "506501599000"

# VPC
network_name            = "qserv-int-vpc"
subnets = [
  {
    "subnet_ip" : "10.134.0.0/23",
    "subnet_name" : "subnet-us-central1-01",
    "subnet_region" : "us-central1"
  }
]
secondary_ranges = {
  "subnet-us-central1-01" : [
    {
      range_name    = "kubernetes-pods"
      ip_cidr_range = "10.135.0.0/16"
    },
    {
      range_name    = "kubernetes-services"
      ip_cidr_range = "10.134.16.0/20"
    },
  ]
}

# Filestore
fileshare_capacity = 2000

# NAT
nats = [{ name = "cloud-nat" }]