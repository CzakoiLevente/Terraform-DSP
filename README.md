# Terraform-SDP

Three environments: Staging, Dev and Production EC2 servers are created. <br>
All the dependencies are automatically installed after the server creation from the TF file. <br>
The app itself is automatically deployed and started after the server has been created.

## Tech spec

  - `aws.tf` added for aws security group
  - `instances.tf` creates the 3 environments
  - `script.sh` explained in comments step by step
