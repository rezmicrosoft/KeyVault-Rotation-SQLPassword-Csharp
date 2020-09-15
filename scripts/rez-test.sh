kv_name='rez-sqlrotation-kv'
sql_server_resource_id='/subscriptions/27b750cd-ed43-42fd-9044-8d75e124ae55/resourceGroups/rez-test-packer/providers/Microsoft.Sql/servers/reztest'

az account set -s 27b750cd-ed43-42fd-9044-8d75e124ae55

az group deployment create -g rez-test --template-uri ../arm-templates/azuredeploy.json --parameters @../arm-templates/parameters/rez-test.json

expire_on=$(date -u --date='tomorrow' '+%Y-%m-%dT%H:%M:%SZ')

az keyvault secret set --name sqlAdminPassword --vault-name rez-sqlrotation-kv --value "Simple123" --tags "CredentialId=sqlAdmin" "ProviderAddress=$sql_server_resource_id" "ValidityPeriodDays=90" --expires $expire_on