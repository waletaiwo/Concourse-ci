init:
	mkdir -p vault-data 
	vault server -config vault_autounseal.hcl 

export:
	export VAULT_ADDR="http://172.20.10.4:8200"

unseal:
	vault operator unseal

transit:
	vault secrets enable transit
	vault write -f transit/keys/autounseal
	vault policy write autounseal autounseal_policy.hcl
	vault token create -policy="autounseal"


