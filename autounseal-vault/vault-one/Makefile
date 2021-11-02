init:
	mkdir -p vault-data 
	vault server -config vault_autounseal.hcl 

unseal:
	vault operator unseal


transit:
	vault secrets enable transit
	vault write -f transit/keys/autounseal
	vault policy write autounseal autounseal_policy.hcl
	vault token create -policy="autounseal"


