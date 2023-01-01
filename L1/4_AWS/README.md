## EPAM University Programs Cloud&DevOps Fundamentals Autumn 2022 
# AWS Cloud Basic

## 1. Read the terms of Using the [AWS Free Tier](./https://docs.aws.amazon.com/en_us/awsaccountbilling/latest/aboutv2/billing-free-tier.html) and the ability to control their own costs.
   
+ Free Trials Short-term free trial offers start from the date you activate a particular service

+ 12 months free Enjoy these offers for 12-months following your initial sign-up date to AWS

> Information about limits of Free Tier: User -> Billing -> Free Tier

![free tier](./img/1_free_tier.png)

+ Ability to control own cost achive via creating billing alarm:

Create Billing Alarm for expense notification (I already have one so I just edit some steps):
Choose CloudWatch -> Create alarm -> Do the following steps:
+ Step1 Specify metric and conditions 				
+ Step2 Configure actions
  
![billing alarm](./img/2_biling_alarm.PNG)

+ Step 3 Add name and description  
+ Step 4 Preview and create
+ After creating alarm confirm receipt of notifications on your email

![bil_al_notif](./img/3_biling_alarm.PNG)

## 2. [Register with AWS](.https://portal.aws.amazon.com/billing/signup?redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start) (first priority) or alternatively, you can request access to courses in [AWS Academy](.https://aws.amazon.com/ru/training/awsacademy/member-list/) if you are currently a student of certain [University](.https://aws.amazon.com/ru/training/awsacademy/member-list/).

## 3. Find the [hands-on tutorials](.https://aws.amazon.com/ru/getting-started/hands-on/?awsf.getting-started-category=category%23compute&awsf.getting-started-content-type=content-type%23hands-on&?e=gs2020&p=gsrc&awsf.getting-started-level=*all) and [AWS Well-Architected Labs](.https://www.wellarchitectedlabs.com/) for your AWS needs. Explore list of step-by-step tutorials for deferent category. Use, repeat as many as you can and have fun))
   

## 4. Register and pass courses on [AWS Educate](.https://aws.amazon.com/ru/education/awseducate/). Filter by checking Topic Cloud Computing and Foundational Level. Feel free to pass more.

## 5. Register and pass free courses on [AWS Skillbuilder](.https://explore.skillbuilder.aws/learn). AWS Cloud Practitioner Essentials: Core Services, AWS Cloud Practitioner Essentials: Cloud Concepts. Try AWS Cloud Quest: Cloud Practitioner.

## 6. Pass free courses on [Amazon qwiklabs](.https://amazon.qwiklabs.com/)

----
## 7. Review [Getting Started with Amazon EC2](.https://aws.amazon.com/ru/ec2/getting-started/?nc1=h_ls). Log Into Your AWS Account, Launch,  Configure, Connect and Terminate Your Instance. Do not use Amazon Lightsail. It is recommended to use the t2 or t3.micro instance and the CentOS operating system.

The process of creating and configuring an instance is shown below

+ Launch Instance:
  
![ec2-launch](./img/4_EC2.PNG)

+ Configure:

![Configure1](./img/5_EC2.PNG)

![Configure2](./img/6_EC2.PNG)

+ Connect:
  + See running Instance:
  
![Connect](./img/7_EC2_running.png)

![Connect](./img/8_EC2_connect.PNG)

+ Terminate:

![Terminate](./img/9_EC2_terminated.PNG)

----
## 8. Create a snapshot of your instance to keep as a backup.

![snapshot](./img/10_EC2_snapshot.PNG)

---
## 9. Create and attach a Disk_D (EBS) to your instance to add more storage space. Create and save some file on Disk_D.

- Create Volume (EBS):
  
![cr_volume](./img/11_EC2_volume.PNG)

-	Volume setting. 
> Remember: Availability Zone must be same to Volume and Instance by that it be attached

![volume_set](./img/12_EC2_volume.PNG)

-	Attach volume:

![volume_attache](./img/13_EC2_volume.PNG)

![volume_attache](./img/14_EC2_volume.png)

- Connect to Instance and **Mount Disk_D** ( [setting guid](.https://thinkcloudly.com/how-to-create-an-ebs-volume) ):

> `$ sudo lsblk`  and get `xvdf` as the Disk_D name:

![mount_D](./img/15_EC2_mount_D.PNG)

To mount Disk_D, we must first access it. Type  ` $ sudo file -s /dev/xvdf `

Output will give us `data` that means there is no file system on the device and we have to create one. Use command (ext4 is for formatting):

`$ sudo mkfs -t ext4 /dev/xvdf ` 


![mount_D](./img/16_EC2_mount_D.png)


Type `sudo mkdir /data` “data” folder is created and it will show as `xvdf/data`

Now to mount it:  `sudo mount /dev/xvdf /data`.

To confirm type `lsblk` and press enter and you will see `xvdf` is mounted to the data folder.


![mount_D](./img/17_EC2_mount_D.png)


Go to data folder by typing `cd /data`

Make a file: type `sudo touch EPAM-task.txt` 

To confirm it is created or not type `ls -la`

![mount_D](./img/18_EC2_mount_D.PNG)

Edit file using VI editor here. Type `sudo vi EPAM-task.txt`

Type `cat EPAM-task.txt`. See output `hello, EPAM!`

![mount_D](./img/19_EC2_mount_D.PNG)

---

## 10.   Launch the second instance from backup.
   
![AMI](./img/19_EC2_VM2.PNG)
![AMI](./img/20_EC2_VM2.PNG)

- Launch Instance from created AMI:
  
![AMI](./img/21_EC2_VM2.PNG)

![AMI](./img/22_EC2_VM2.PNG)

----
## 11.   Detach Disk_D from the 1st instance and attach disk_D to the new instance.
   
+ Detach Disk_D from the 1st instance:

![detach](./img/23_EC2_detach.PNG)

+ attach disk_D to the 2nd instance:

![attach](./img/24_EC2_detach.PNG)

+ Connect to VMs (see commands to initially connect the disk to the system in 8th step) and check detached/attached disk

![vms](./img/25_EC2_detach.PNG)

----

## 12.   Review the [10-minute example](.https://aws.amazon.com/ru/getting-started/hands-on/get-a-domain/?nc1=h_ls). Explore the possibilities of creating your own domain and domain name for your site. Note, that Route 53 not free service. Alternatively you can free register the domain name *.PP.UA and use it.

Go to "nic.ua" 
-  choose domain name (in my case it romaniuk.pp.ua)
-  complete the registration procedure

![pp.ua](./img/26_pp.ua.PNG)  

-  activate the domain

![pp.ua](./img/27_pp.ua.PNG)  
 
---

## 13.   Launch and configure a WordPress instance with Amazon Lightsail [link](.https://aws.amazon.com/ru/getting-started/hands-on/launch-a-wordpress-website/?trk=gs_card)

> **Step1: Create a WordPress instance in Lightsail**

- a. Sign in to the Lightsail console.
- b. On the Instances tab of the Lightsail home page, choose Create instance.
- c. An AWS Region and Availability Zone is selected. Choose `Change AWS Region` and Availability Zone if you want to create instance in another location.

![Lightsail](./img/40_Lightsail.png)

- d. Choose instance image.
  - Choose Linux/Unix as the platform.
  - Choose WordPress as the blueprint.

![Lightsail](./img/41_Lightsail.PNG)


- e. Choose an instance plan.

![Lightsail](./img/42_Lightsail.PNG)

- f. Enter a name for your instance and choose Create instance("EPAM-task-WordPress-13"):
  
![Lightsail](./img/43_Lightsail.PNG)
![Lightsail](./img/44_Lightsail.PNG)

> **Step 2 Connect to instance via SSH and get the password for WordPress website**
- a.	On the Instances tab of the Lightsail home page, choose the SSH quick-connect icon for WordPress instance.
- b.	After the browser-based SSH client window opens, enter the following command to retrieve the default application password:
`cat $HOME/bitnami_application_password`

![Lightsail](./img/45_Lightsail.PNG)

- c. To sign in to the administration dashboard of your WordPress website the password displayed on the screen.

> **Step 3 Sign in to the administration dashboard of WordPress website**
- a. In a browser, go to:
  `http://35.173.122.217/wp-login.php`
- b. Log in to your instance. 
   - In the Username or Email Address box, enter **user.** 
   - In the Password box, enter the default password obtained in Step 2

![Lightsail](./img/46_Lightsail.PNG)

   - 	Choose Log in

![Lightsail](./img/47_Lightsail.PNG)

> **Step 4 Create a Lightsail static IP address and attach it to your WordPress instance**

- a.	On the Instances tab of the Lightsail home page, choose running WordPress instance.
- b.	Choose the `Networking tab`, then choose `Create static IP`.
- c.	Select the `created WordPress instance` from the Attach to an instance dropdown.
- d.	Name your static IP, then choose `Create`. 
  
![Lightsail](./img/48_Lightsail.PNG)
![Lightsail](./img/49_Lightsail.PNG)

> **Step 5: Create a Lightsail DNS zone and map a domain to WordPress instance**

- a. On the Networking tab of the Lightsail home page, choose Create DNS zone. 
- b. Enter your domain, then choose Create DNS zone. 
- c. Make note of the name server address listed on the page.

![Lightsail](./img/50_Lightsail.PNG)

![Lightsail](./img/51_Lightsail.PNG)

- d. add DNS records:

![Lightsail](./img/52_Lightsail.PNG)

> **Step 6: Clean up**
- a. On the Instances tab of the Lightsail home page, choose the ellipsis (`⋮`) icon next to the WordPress instance and choose `Delete`.
- b. Choose Yes, delete from the prompt.

![Lightsail](./img/53_Lightsail.png)

---

## 14.   Review the [10-minute](./https://aws.amazon.com/ru/getting-started/hands-on/backup-files-to-amazon-s3/) Store and Retrieve a File. Repeat, creating your own repository.
- Open S3 service console and choose `Create bucket`:

![S3](./img/54_S3.PNG)

-	Enter unique bucket name and set configuration:

![S3](./img/55_S3.PNG)

-	Upload any file: 

![S3](./img/56_S3.PNG)

-	Leave default setting and choose `Upload`:

![S3](./img/57_S3.PNG)

-	Download file on local machine:

![S3](./img/58_S3.PNG)

- Clean up: Delete object (delete file from bucket):

![S3](./img/59_S3.PNG)

-  delete bucket:
  
![S3](./img/60_S3.PNG)

----
   
## 15.   Review the 10-minute example Batch upload files to the cloud to Amazon S3 using the AWS CLI. Create a user AWS IAM, configure CLI AWS and upload any files to S3. 

> **Step 1: Create an AWS IAM User**

![IAM](./img/61_IAM.PNG)

Choose: `Users` -> `Add user` 
-> select `Programmatic access` 
-> Click the `Next: Permissions`

![IAM](./img/62_IAM.PNG)

Click on `Attach existing policies` directly option. Select AdministratorAccess then click `Next: Tags.` 

![IAM](./img/63_IAM.PNG)

click on `Create user` and  `Download Credentials`:

![IAM](./img/64_IAM.PNG)

![IAM](./img/65_IAM.PNG)

![IAM](./img/66_IAM.PNG)

> **Step 2: Install and Configure the AWS CLI**

Install the AWS CLI on local VM:
```bash
sudo yum install awscli 
```
![CLI](./img/67_CLI.PNG)

Type `aws configure` and press enter. 
Enter the following (from the *credentials.csv* file) when prompted:

![CLI](./img/68_CLI.PNG)

To create a new bucket named romaniuk-epam-bucket2, enter the following:
```
aws s3 mb s3://romaniuk-epam-bucket2
```
![CLI](./img/69_CLI.PNG)

To upload the file *Task_AWS* located in the local directory (~/) to the S3 bucket *romaniuk-epam-bucket2* use the following command:
```
aws s3 cp s3 “/home/marharita/task_AWS” s3:// romaniuk-epam-bucket2
```
![CLI](./img/70_CLI.PNG)

To delete *task_AWS*  from bucket *romaniuk-epam-bucket2*, use the following command:
```
aws s3 rm s3:// romaniuk-epam-bucket2/task_AWS
```
![CLI](./img/71_CLI.PNG)

---

## 16.   Review the 10-minute example Deploy Docker Containers on Amazon Elastic Container Service (Amazon ECS). Repeat, create a cluster, and run the online demo application or better other application with custom settings.

This guide uses AWS Fargate 
> **Step 1: Set up first run with Amazon ECS**

![ECS](./img/72_ECS.PNG)

> **Step 2: Create container and task definition**

+ a.	In the Container definition field, select `sample-app`.

![ECS](./img/73_ECS.PNG)

![ECS](./img/74_ECS.PNG)

> **Step 3: Define service**

•**Service name:** The default `sample-app-service` is a web-based *"Hello World"* application provided by AWS. 

•	**Number of desired tasks:** Leave the default value of `1`. This will create one copy of your task.

•	Select the `Application Load Balancer` option.
•	Review your settings and choose `Next`. 


![ECS](./img/75_ECS.PNG)

> **Step 4: Configure cluster**

•	In the **Cluster name** field, enter `epam-cluster` and choose `Next`.

![ECS](./img/76_ECS.PNG)

>**Step 5: Launch and view resources**

• Review task definition, task configuration, and cluster configuration before launching. Choose `Create`.

• **Launch Status** page shows the status of  launch and describes each step of the process. After the launch is complete, choose `View service`. 

![ECS](./img/77_ECS.PNG)

> **Step 6: Open the sample application**

 + On the **sample-app-service** page, select the `Details` tab and select the entry under `Target Group Name`. 

+ On the `Target groups` page, select the target group name. 

![ECS](./img/78_ECS.PNG)

+ In the **Details** section, choose the `Load balancer link`. 

+ In the **Description** tab, select the two page icon next to the load balancer DNS to copy the DNS name to your clipboard. 

![ECS](./img/79_ECS.PNG)

 + Paste it into a new browser window, and press enter to view the sample application (in this case, a static webpage).

  ![ECS](./img/80_ECS.PNG)

> **Step 7: Clean up**

+ Choose `Delete Cluster` to delete the cluster.
+ Enter `delete me` in the dialog box and choose `Delete`.
  
Once everything has been deleted, you will see the Deleted cluster sample-cluster successfully message in green.
  
 ![ECS](./img/81_ECS.PNG)


 ## **Creating a container image for use on Amazon ECS**
+ Install Docker into EC2 according guide: https://linuxconfig.org/how-to-install-docker-in-rhel-8

```
sudo dnf install docker-ce-3:20.10.22-3.el9
```
![docker](./img/72_docker.PNG)

![docker](./img/73_docker.PNG)


Start the Docker service.
```
sudo systemctl start docker
sudo systemctl status docker
```
![docker](./img/74_docker.PNG)


Add the ec2-user to the docker group so you can execute Docker commands without using sudo.
```
sudo usermod -a -G docker ec2-user
````
Log out and log back in again

Create a Docker image:
+ Create directory for Dockerfile
```
mkdir my_epam_docker
```

-	Go to `my_epam_docker` and create Dockerfile

```
cd my_epam_docker
touch Dockerfile
```
Edit the Dockerfile you just created and add the following content:

```bash
FROM ubuntu:18.04

# Install dependencies
RUN apt-get update && \
 apt-get -y install apache2

# Install apache and write hello world message
RUN echo 'Hello, EPAM from Docker!' > /var/www/html/index.html

# Configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \ 
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \ 
 chmod 755 /root/run_apache.sh

EXPOSE 80

CMD /root/run_apache.sh
```

Build the Docker image from Dockerfile.
````
sudo docker build -t epam-task .
````

Run docker images to verify that the image was created correctly.
```
docker images --filter reference=epam-task
```

![docker](./img/75_docker.PNG)

```
docker images --filter reference=epam-task
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
epam-task    latest    f1cef885984c   2 minutes ago   203MB
```
![docker](./img/76_docker.PNG)

Run the newly built image:
```
docker run -t -i -p 800:80 epam-task
``` 
Open a browser and point to the server that is running Docker and hosting your container. You should see a web page with `Hello EPAM from Docker!` statement.

![docker](./img/77_docker.PNG)

Stop the Docker container by typing `Ctrl + c`.


----

## 17.   Run a Serverless "Hello, World!" with AWS Lambda.

> **Select a Lambda blueprint**

- Open the AWS Lambda Console

![lambda](./img/82_Lambda.PNG)

+ a.	In the AWS Lambda console, choose `Create function`.

![lambda](./img/83_Lambda.PNG)

+ b.	Select `Use a blueprint`.
+ c.	 In the Filter box, enter `hello-world-python` and select the hello-world-python blueprint.
+ d.	  Then choose `Configure`.

![lambda](./img/84_Lambda.PNG)

> **Configure and create Lambda function.**

Basic information:

  + Name:  enter `hello-world-python`.
  + Role:  Select `Create a new role from AWS policy templates`.
  + Role name: type `lambda_basic_execution`.

![lambda](./img/85_Lambda.PNG)

+ Go to the bottom of the page and choose Create function.
  
![lambda](./img/86_Lambda.PNG)

> **Invoke Lambda function and verify result**

+ Enter an event to test function.
    + Select `Create new event`.
    + Type in an event name like `Hello_World_Event`.
    + Retain default setting of `Private` for Event sharing settings.
    + Choose `hello-world`  from the template list.
    + Replace `value3` with `Hello, EPAM from Lambda!`.

+ Select `Create`.

![lambda](./img/87_Lambda.PNG)

![lambda](./img/88_Lambda.PNG)

Choose `Test`.
•	The Execution results tab verifies that the execution succeeded.

![lambda](./img/89_Lambda.PNG)

> **Select the `Monitor` tab to view the results.**

The Monitoring tab will show seven CloudWatch metrics: *Invocations*, *Duration*, *Error count and success rate (%)*, *Throttles*, *Async delivery failures, IteratorAge*, and *Concurrent executions*.

![lambda](./img/90_Lambda.PNG)

> **Delete Lambda function**
  
  Select the `Actions` button and select `Delete function`.


![lambda](./img/91_Lambda.PNG)

![lambda](./img/92_Lambda.PNG)

---

## 18.   Create a static website on Amazon S3, publicly available (link1 or link2 - using a custom domain registered with Route 53). Post on the page your own photo, the name of the educational program (EPAM Cloud&DevOps Fundamentals Autumn 2022), the list of AWS services with which the student worked within the educational program or earlier and the full list with links of completed labs (based on tutorials or qwiklabs). Provide the link to the website in your report and СV

> **Step 1: Create a bucket**

For creating buckets and upload files in I use AWS CLI and following commands:

```
aws s3 mb s3://romaniuk.pp.ua --region eu-central-1

aws s3 mb s3://www.romaniuk.pp.ua --region eu-central-1

aws s3 cp index.html s3://romaniuk.pp.ua

aws s3 cp error.html s3://romaniuk.pp.ua

aws s3 sync . s3://romaniuk.pp.ua
```
![web_s3](./img/94_s3web.PNG)

> **Step 2: Enable static website hosting**

+ In the **Buckets** list, choose the name of the bucket.
+ Choose `Properties`.
+ Under **Static website hosting**, choose `Edit`.
+ Choose `Use this bucket to host a website`.
+ 	Under **Static website hosting**, choose `Enable`.
+ In **Index document**, enter `index.html`.
+ in Error document enter the custom error.html.
+ Choose `Save changes`.
+ Under **Static website hosting**, note the `Endpoint`.

![web_s3](./img/95_s3web.PNG)

![web_s3](./img/96_s3web.PNG)

> **Step 3: Edit Block Public Access settings**

+ Choose `Permissions`.
+ Under **Block public access (bucket settings)**, choose `Edit`.
+ Clear **Block** *all* **public access**, and choose `Save changes`.

![web_s3](./img/97_s3web.PNG)

> **Step 4: Add a bucket policy that makes bucket content publicly available**
 
+ Choose `Permissions`
+ Under **Bucket Policy**, choose `Edit`
+ To grant public read access for website, copy the following bucket policy, and paste it in the **Bucket policy editor.**

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::romaniuk.pp.ua/*"
            ]
        }
    ]
}
```
![web_s3](./img/98_s3web.PNG)

+ Choose `Save changes`.

![web_s3](./img/99_s3web.PNG)

> **Step 5: Configure an index document and an error document**

+ Save the index and file error locally.
+ Upload files to bucket (see **Step1**)

![web_s3](./img/100_s3web.PNG)


> **Step 7: Test website endpoint**

+ Under **Buckets**, choose the name of bucket.
+ Choose `Properties`/.
+ At the bottom of the page, under **Static website hosting**, choose `Bucket website endpoint`.

![web_s3](./img/101_s3web.PNG)

+ Index document opens in a separate browser window.

![web_s3](./img/102_s3web.PNG)

> **Step 8: Configuring a static website using a custom domain registered with Route 53**

+ Go to **Route 53** choose `Create hosted zone`

![web_s3](./img/103_s3web.PNG)

![web_s3](./img/104_s3web.PNG)

![web_s3](./img/105_s3web.PNG)

> **Step 9: Add alias records for domain and subdomain**

+ Choose `Create record`.
+ Choose `Switch to wizard`.
+ Choose `Simple routing`, and choose `Next`.
+ Choose `Define simple record`.
+ In **Record name**, accept the default value, which is the name of your hosted zone and your domain.
+ In **Value/Route traffic to**, choose `Alias to S3 website endpoint`.
  -	In Record type, choose `A ‐ Routes traffic to an IPv4 address and some AWS resources`.
  -	For **Evaluate target health**, choose `No`.
  -	Choose `Define simple record`.


![web_s3](./img/106_s3web.PNG)

+ To add an alias record for subdomain same steps accept adding `www.`.
On the **Configure records** page, choose `Create records`.
  
![web_s3](./img/107_s3web.PNG)

+ I use activated domain on *pp.ua. Add entries to the list of your own server names ns from AWS Hosted zone record 

![web_s3](./img/108_s3web.PNG)

>**Step 10: Configure subdomain bucket for website redirect**

To configure a redirect request
+ On the Amazon S3 console, in the **Buckets** list, choose subdomain bucket name.
+ Choose `Properties`.
+ Under **Static website hosting**, choose `Edit`.
+ Choose `Redirect requests for an object`.
+ In the **Target bucket** box, enter root domain, for example.
+ For Protocol, choose `http`.
+ Choose `Save changes`.

![web_s3](./img/109_s3web.PNG)

