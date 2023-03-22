# **Lambda-Terraform-Bootstrap.**

<!-- TABLE OF CONTENTS -->
<summary>Table of Contents</summary>
<ol>
<li><a href="#project-outline">Project Outline</a></li>
<li><a href="#limitations-and-assumptions">Limitations and Assumptions</a></li>
<li><a href="#to-do">To-Do</a></li>
<li><a href="#worflow">Workflow</a></li>
<li><a href="#directory-structure">Directory Structure</a></li>
<li><a href="#prerequisites">Prerequisites</a></li>
<li><a href="#adding-your-own-lambda-source-code">Adding your own Lambda source code</a></li>
</ol>

# **Project Outline.**

Scalable deployment of Lambda functions to AWS via. Terraform.

The purpose of this project is to demonstrate how someone or an organisation may deploy multiple, custom Lambda functions to a single AWS account using a combination of Python, Terrafrom, Makefile & Github Actions.

# **Limitations and Assumptions.**

This project assumes that Software Developers produce, maintain & update their own source code. This project also assumes that the infrastructure is maintained seperately from the Lambda source code by its own DevOps team. 

<ins>**Terraform code has been placed in this repo for visibility & for pure demonstrative purposes as things stand.**</ins>

Currently, the project only supports local Terraform back-ends & local, manual Terraform commands to deploy the Lambda infrastructure.

<ins>The project also assumes that for each Lambda resource, a relevant Lambda execution role & S3 bucket already exist to house deployment artifacts such as the distribution package & SHA256 values.</ins>

As I do not want to exposure any infrastructure within my personal AWS account, this project contains placeholders for these values under the Terraform configuration file, which can be found [here](https://github.com/dantaylrr/lambda-terraform-bootstrap/blob/dev/terraform/projects/lambda/terraform.auto.tfvars).

# **To-Do.**

* Implement Terraform remote backend using S3 & DynamoDB for state-file locking.
* Implement ```terraform plan``` & ```terraform apply``` in CI/CD.
* Add integration tests for Lambda's & implement into workflow.

# **Workflow\*.**

_\*Subject to change._

The below diagram demonstrates the current workflow upon initial deployment (i.e. Terraform hasn't yet deployed any Lambda infrastructure):

<img src='./images/workflow/InitialTFDeploy.drawio.png'>

The below diagram demonstrates the current workflow when source code has been updated & after Terraform has provisioned the Lambda infrastructure:

<img src='./images/workflow/SubsequentTFDeploy.drawio.png'>

# **Directory Structure.**

```
📦 lambda-terraform-bootstrap
├─ .github
│  └─ workflows
│     ├─ <project-name1>.yml
│     └─ <project-name2>.yml
images
│  └─ markdown
│     ├─ InitialTFDeploy.drawio.png
│     └─ SubsequentTFDeploy.drawio.png
├─ lambda
│  ├─ <project1>
│  │  ├─ src
│  │  │  ├─ main
│  │  │  │  └─ app.py
│  │  │  └─ utils
│  │  │     └─ <utils1>
│  │  │        └─ utils.py
│  │  ├─ tests
│  │  │  └─ unit
│  │  │     └─ test_methods.py
│  │  └─ requirements.txt
│  └─ <project2>
│     ├─ src
│     │  ├─ main
│     │  │  └─ app.py
│     │  └─ utils
│     │     └─ <utils2>
│     │        └─ utils.py
│     ├─ tests
│     │  └─ unit
│     │     └─ test_methods.py
│     └─ requirements.txt
├─ terraform
│  ├─ modules
│  │  └─ lambda
│  │     ├─ data.tf
│  │     ├─ locals.tf
│  │     ├─ main.tf
│  │     └─ variables.tf
│  └─ projects
│     └─ lambda
│        ├─ locals.tf
│        ├─ main.tf
│        ├─ provider.tf
│        ├─ terraform.auto.tfvars
│        └─ variables.tf
├─ .gitignore
├─ Makefile
└─ README.md
```
# **Prerequisites.**

Project assumes that a Lambda-compatible Python version is installed on your local machine.

Please find a list of available versions here:

https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html

Python can be installed on your local machine using a package manager such as [Homebrew](!https://brew.sh/):

```
brew install python
```

The project also assumes that Terraform is installed locally:

```
brew install terraform
```

The project heavily utilises GitHub Actions & the use of AWS Access Keys in order to deploy Lambda infrastructure into your AWS account. 

Please familiarise yourself with GitHub Actions for AWS infrastructure deployment & add your own account access keys before attempting to run any workflow files.

Good documentation (minus Terraform Cloud implementation) can be found on the [HashiCorp website](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions).

# **Adding your own Lambda source code.**

The main advantage to this design is it's scalability. The user can add & provision their own custom Lambda functions to this repo & dynamically deploy them into their own AWS account.

Steps:

1). Add a new working directory under ```./lambda/```, housing all source code & package requirements for the new lambda function.

2). Locally develop custom source code, add unit tests.

3). Add corresponding workflow file, ```<project-name>.yml``` & be sure to edit input parameters such as ```WORKING_DIR``` & ```LAMBDA_FUNCTION_NAME``` env. variables.

4). Add desired Lambda configuration fields to Lambda tf.autovars file, found [here](https://github.com/dantaylrr/lambda-terraform-bootstrap/blob/dev/terraform/projects/lambda/terraform.auto.tfvars) under the ```./terraform/projects/lambda/``` directory.

5). Push changes to GitHub remote & trigger the appropriate workflow file - all workflows heavily rely on a generalised ```Makefile``` that will run bash commands in our remote environment.
