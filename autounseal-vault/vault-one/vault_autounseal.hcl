ui = true
disable_mlock = true 

storage "file" {
    path = "./vault-data"
}

listener "tcp" {
    address = "172.20.10.4:8200"
    tls_disable = "true"
}

