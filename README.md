# octo-goggles

Infrastructure as code to deploy microservices application using Terraform.

## Requirements

* Terraform >= 0.12
* an docker image with an http application
* AWS account and credentials available on .aws/credentials

## Overview

The purpose of this project is deploy a microservice application on AWS. We are
using the public docker container available on Docker Hub under
maraloide/pokeapi. This application is a simple API to help Pokemon game users to create
and manage teams. The application will be listening for HTTP requests on port
5000.

The infrastructure is designed to run on a AWS ECS cluster using AWS Fargate
behind a Application Load Balancer. After executing the terraform scripts the
following resources will be created:
* A Virtual Private Cloud with private and public subnets
* Multiples running containers instances
* A Load Balancer distributing traffic between the containers
* Auto scaling of our resources
* Health check and logs

## Usage

* Deplying the application on AWS
First, clone this repository source code and go to the root folder.

    ```
    $ terraform init terraform/
    $ terraform plan terraform/
    $ terraform apply terraform/
    ```

You will see a message saying "apply complete":

```
Apply complete! Resources: 32 added, 0 changed, 0 destroyed.

Outputs:

alb_hostname = poke-load-balancer-<url-to-access-the-application>.elb.amazonaws.com
```

***NOTE***: The alb_hostname is the address to access the application.

Now you can use the browser to access the application or use the terminal to make curl requests.

## Testing the API

Go to http://<alb_hostname>:5000/api/ui to interact with the REST API.

![Screenshot](https://github.com/loide/loide.github.io/blob/master/images/pokeapi.png?raw=true)

The browser interface gives direction about how to send requests.

## Cleanup

```
$ terraform destroy terraform/
```
It will delete all resources created by this terraform application.
