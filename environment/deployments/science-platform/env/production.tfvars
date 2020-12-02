# Project
environment             = "stable"
application_name        = "science-platform"
folder_id               = "719717645081"

# VPC
network_name            = "science-platform-stable-vpc"
subnets = [
  {
    "subnet_ip" : "10.132.0.0/23",
    "subnet_name" : "subnet-us-central1-01",
    "subnet_region" : "us-central1"
  }
]
secondary_ranges = {
  "subnet-us-central1-01" : [
    {
      range_name    = "kubernetes-pods"
      ip_cidr_range = "10.133.0.0/16"
    },
    {
      range_name    = "kubernetes-services"
      ip_cidr_range = "10.132.16.0/20"
    },
  ]
}

# GKE
master_ipv4_cidr_block = "172.18.0.0/28"
node_pool_1_name = "core-pool"
node_pool_1_machine_type = "e2-standard-4" # 4 vCPU 16GB RAM
node_pool_1_min_count = 1
node_pool_1_max_count = 15
node_pool_1_disk_size_gb = 100
node_pool_1_initial_node_count = 5

# Filestore
fileshare_capacity = 2000