az account set -s 27b750cd-ed43-42fd-9044-8d75e124ae55

az group deployment create -g rez-test --template-file ../arm-templates/onlyfunctionapp.json