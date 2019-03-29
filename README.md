[![](https://images.microbadger.com/badges/image/jscruz/aws-ecr.svg)](https://microbadger.com/images/jscruz/aws-ecr "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/jscruz/aws-ecr.svg)](https://microbadger.com/images/jscruz/aws-ecr "Get your own version badge on microbadger.com")
# aws-ecr
AWS ECR command line tool

This repository creates an image based on python and install the AWS CLI tool. 

## Usage

```
docker pull jscruz/aws-ecr
docker run jscruz/aws-ecr myrepo [region]
```
The region parameter can be specified or it will use the same as the EC2 instance that is running as it uses the metadata of the instance.
