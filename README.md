# Ansible-Terraform-Example


This project has been create to show how the jenkins can automate the terraform flow with the help of jenkins file.
Follow standard pipeline to create a workflow and deploy instance with automation.



*Note : Abreviation : GH - GitHub, Terraform - TR, Jenkins - JK



# Steps for Manual Deployment:

1. Insatll Python on your machine.
2. Install Pip
3. install AWS CLI
4. Configure AWS Credential as given below;
   
   []$ aws configure
   
   AWS Access Key ID [None]: (Put the access key)
   
   AWS Secret Access Key [None]: (put secret key)
   
5. Install Git on you machine and pull this repository

6. Install TF > 0.12v and follow the genral TF steps for deployment
   
   []$ terraform init
   
   []$ terraform plan
   
   []$ terraform apply
   


# Steps for genrating automated workflow via Jenkins:

Bellow are the following requirements
1. TR installed on Jenkins 0.12 (You can install on your machine if you want to try manually as well)
2. Correct plugins installed on Jenkins

   a. Workspace Cleanup Plugin
   
   b. Credentials Binding Plugin
   
   c. AnsiColor Plugin (optional)
   
   d. GH Plugin
   
   e. Pipeline Plugin
   
   f. Blueocean
   
   g. Credentials Plugin

3. GH access token
4. AWS credentials (Specified IAM Role with valid credential key and encryption key)
5. S3 bucket
6. Setup Bucket

*Note: 
Please create a S3 bucket to appaned all the operational data inside it.
Note:- Do not forget to rename your bucket name after pulling this repo in you GH.

# Steps important for configuring credentials in JK


# 1. Configure GitServer 

   a. Create crednetial follow below path:
   
   Jenkins Homepage > Manage Jenkins > Configure system > Check for GH > create Git credentials.
   
   *Name :
   
   *API URL :
   
   *Create Credentials > KIND : Secret text > Scope : Global > Secret : Secret token created in GitHub > ID : Any ID > Discription : Any
   
   b. Save
   
   c. Verify if the connection is succesfull in between git and jenkins.
   
   * Credentials verified for user #######, rate limit: 4998 (This success error should poped up while testing the connections)
   
# 2. Create Git username 

   a. Jenkins Homepage > Credentials > System > Store Scopes to Jenkins (Jenkins) > Add Credentials 
   
   b. *Create Credentials > KIND : Username and password > Scope : Global > Username : Any > Password : Secret token created in GH > ID : Any ID > Discription : Any
   
   c. Save
   
# 3. Create AWS Crednetial

   a. Jenkins Homepage > Credentials > System > Store Scopes to Jenkins (Jenkins) > Add Credentials 
   
   b. *Create Credentials > KIND : AWS Credentials > Scope : Global > ID : awsCredentials > Discription : (Optianal) > Access Key ID : Your Access key Id genrated while creating IAM role. > Secret Access Key : Your Secret Access key genrated while creating IAM role.
   
   c. Save
   
   
# Now you're good to got to create a JK Job

## 1. New Item 
## 2. Enter an Item Name : Any(Whatever you like)
## 3. Select > Multiple Branch
## 4. Save

## Edit Job [Option 1]

*Scroll down to Branch Source > Add source > GitHub > Select the Credentials You've created > Owner : Your Git Owner Name > Repository : Name of the repository > Save

## Edit Job [Option 2] 

#Follow below steps to work in Open Blue Ocean Mode
1. JK Homepage
2. Open Blue Ocean
3. New Pipeline > Where do you store your code? : Select Github > Connect to GitHub : Use same Access token used while configureing git server > Use from list of repository
4. Save

# Now make sure all steps have been followed and verified properly.

# VOILA YOU'RE GOOD TO GO TO TRIGGER THE JOB.
 
 
*NOTE - PLEASE OPEN THE ISSUE IF YOU FOUND ANY PROBLEN WHILE RUNNING THE JOB AND I SHALL ANSWER YOU FOR THE SAME.

## REGARDS - PRANAY S  
  
   

