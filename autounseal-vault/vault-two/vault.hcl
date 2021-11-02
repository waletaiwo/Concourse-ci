ui = true
disable_mlock = true 

storage "file" {
    path = "./vault-2/data"
}

listener "tcp" {
    address = "172.20.10.4:8100"
    tls_disable = "true"
}

seal "transit" {  
    address = "http://172.20.10.4:8200"  
    token = ""
    disable_renewal = "false"  
    key_name = "autounseal"  
    mount_path = "transit/"  
    tls_skip_verify = "true"
}