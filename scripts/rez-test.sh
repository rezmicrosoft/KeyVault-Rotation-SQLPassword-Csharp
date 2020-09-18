kv_name='rez-sqlrotation-kv'
sql_server_resource_id='/subscriptions/27b750cd-ed43-42fd-9044-8d75e124ae55/resourceGroups/rez-test-packer/providers/Microsoft.Sql/servers/reztest'
sql_admin_pwd='34754262-b59b-4324-8ea8-4e033826dfe3'

az account set -s 27b750cd-ed43-42fd-9044-8d75e124ae55

az group deployment create -g rez-test --template-file ../arm-templates/azuredeploy.json --parameters @../arm-templates/parameters/rez-test.json

expire_on=$(date -u --date='tomorrow' '+%Y-%m-%dT%H:%M:%SZ')

az keyvault secret set --name sqlAdminPassword --vault-name rez-sqlrotation-kv --value $sql_admin_pwd --tags "CredentialId=rez" "ProviderAddress=$sql_server_resource_id" "ValidityPeriodDays=90" --expires $expire_on

