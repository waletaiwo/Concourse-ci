init:
	mkdir -p ./vault-2/data
	vault server -config vault.hcl 

secrets:
	VAULT_ADDR=http://172.20.10.4:8100 vault secrets enable -version=1 -path=concourse kv
	VAULT_ADDR=http://172.20.10.4:8100 vault policy write concourse ./concourse-policy.hcl
	VAULT_ADDR=http://172.20.10.4:8100 vault token create --policy concourse --period 3h


clean:
	rm -r vault-2




