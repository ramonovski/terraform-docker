# AWS Terraform

Terraforming a Dockex-Nginx setup in EC2 and ELB.

## Synopsis

This project deploys in an EC2+ELB setup a simple nginx web service in a Docker container that serves a static document, also included in the **files** directory of this project.

EC2 instance is a **t1.micro** based on a Debian Stretch image.

Load Balancer is type **Classic** and, as the EC2 instance, runs on **east-1** region.


## Prerequisites

In order to run it, make sure you have the following requirements: 

- Latest stable Terraform, which can be found here: [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)


- An AWS account. Note that only free tier componens are needed. 


- The following two values from your AWS account that you will need to input in the file **terraform.tfvars**

```
access_key = "insert your access key"
secret_key = "insert your secret key"
```

See the following link to retrieve them:
[Access Keys (Access Key ID and Secret Access Key)](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys)


## Installing

Once you have a copy of this project, execute the following commands:

1. Initializing the working directory 
```
$ terraform init
```

2. Creating an execution plan to make sure everything will run accordingly
```
$ terraform plan
```

3. Applying the changes
```
$ terraform apply
```


<<<<<<< HEAD
### Testing 
Once you see the following output you can now visit the public IP of your instance provided in the output to access the content of the test html page.
=======
## Testing 
Once you see the following output you can now visit the public IP of your instance to access the content of the test html page.
>>>>>>> 841050c7306d9ac7d77c7fd5eb43a00941f3744e
```
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

You can also go to the DNS name of the Load Balancer, also provided in the output, to make sure it's working and start monitoring the activity of the Load Balancer in your AWS Console.
