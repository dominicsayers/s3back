# s3back
Script to backup stuff to S3

### Installation

1.  `sudo apt-get install awscli`
1.  `cd ~/apps`
1.  `git clone git@github.com:dominicsayers/s3back.git`
1.  `cd s3back`
1.  `pico .awsrc` and add your credentials as below

### .awsrc

```
AWS_SECRET_ACCESS_KEY=<your secret access key>
AWS_ACCESS_KEY_ID=<your access key>
AWS_DEFAULT_REGION=<your region>
```
