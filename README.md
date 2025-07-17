# terraform-aws-examples
Terraform IaC for AWS Cloud Infrastructure 

### Steps to Run the Plan with Local Statefile
Make sure terraform installed and AWS Account is configured with Access adn Secret Key as pre-requesties

1.  Clone the repo and navigate to specific folder
2.  Export Following AWS Variables into your command line/terminal (`gitbash` preferred)
```bash
export AWS_ACCESS_KEY_ID=<Your Access Key ID>
export AWS_SECRET_ACCESS_KEY=<Your Secret Access Key>
```
3. Run terraform commands based on the preference
    1. `terraform init` - To initialize Terraform
    2. `terraform apply` -auto-approve=true - Apply Resource creation with auto approval
    3. `terraform destroy` - Destroy created infrastracture
