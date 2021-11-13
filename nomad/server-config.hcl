
data_dir  = "/home/tron/Desktop/Morgan/concourse-ci/nomad"  # provide an absolute path to your preferred directory 

bind_addr = "0.0.0.0" # the default


server {
  enabled          = true
  bootstrap_expect = 1  # not fault tolerant use 3 or higher ( use odd numbers)
}

client {
  enabled = true 
}

vault {
  enabled          = true
  address          = "http://172.20.10.4:8100"
  create_from_role = "nomad-cluster"
  token            = "s.m842aSCHmBqGg2dPU5alF4rD"
}
