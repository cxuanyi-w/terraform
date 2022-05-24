main_vpc_cidr        = "192.168.0.0/24"   # 256 host ip adddresses
public_subnets_cidr  = "192.168.0.0/25"   # 128 host ip addresseses, from 192.168.0.0 to 192.168.0.127
private_subnets_cidr = "192.168.0.128/25" # 128 host ip addresseses, from 192.168.0.128 to 192.168.0.255

bucket_name = "cxy-s3-terraform-bucket" # unique bucket name
acl_value   = "private"                 # acl value, public/private
