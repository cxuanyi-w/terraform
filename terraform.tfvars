region     = "ap-southeast-1"

main_vpc_cidr        = "192.168.0.0/24"   # 256 host ip adddresses
public_subnets_cidr  = "192.168.0.0/26"   # 128 host ip addresseses, from 192.168.0.0 to 192.168.0.63
private_subnets_cidr_1 = "192.168.0.64/26" # 128 host ip addresseses, from 192.168.0.64 to 192.168.0.127
private_subnets_cidr_2 = "192.168.0.128/26" # 128 host ip addresseses, from 192.168.0.128 to 192.168.0.191

bucket_name = "cxy-s3-terraform-bucket3" # unique bucket name
acl_value   = "public"                 # acl value, private, public-read, public-read-write, authenticated-rea, aws-exec-read and log-delivery-write
local_upload_target_lambda_name = "terraform_lambda_upload_from_local"
s3_upload_lambda_name = "terraform_lambda_upload_from_s3"