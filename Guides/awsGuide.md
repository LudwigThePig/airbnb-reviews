# Morgan's Super Awesome EC2 Tutorial!

In this card, you will learn how to deploy your database, service, and proxy to a raw EC2 instance. [Well isn't that neat!](https://www.youtube.com/watch?v=Hm3JodBR-vs)
---
# Sections
1. [Considerations and Groundwork](#Groundwork)
1. [Setting your database](#Databases)
1. [Deploying your service](#Services)
1. [Deploying your proxy](#Proxies)

---
# Groundwork

There are a few things that you should consider and understand before moving forward with EC2 instance. Let's just jump into it.

**What is EC2 (Elastic Cloud Compute)?** EC2 is the heart of Amazon Web Services. Most of the services, such as RDS, EBS, the other EBS, ECS, etc, are built upon or built for EC2 instances.
*What is an EC2 instance?* An EC2 instance is one virtual machine that exists in one of Amazon's data warehouses. You interact with the instance by SSHing into the VM or by interacting with some sort of CLI or GUI console.

**Picking an AMI (Amazon Machine Image)**. AMIs are boiler plate for your VMs. The beauty of AMI, is that you can select an image with as much or as little boiler plate as you like.

![AMI Dashboard](https://imgur.com/BiwRtj1.jpg)

If you want to build your own image from the ground up, select one of the various Linux images from the quickstart tab on the AMI page. You can then SSH into that image and install Mongo, Node, COBOL, or whatever you project demands. Buyer beware, you will have to do a lot more low level work with the operating system. You cannot `brew install node` and get to work.

While learning how to build your own image from the ground up may be a great learning experience, you may opt for one of the robust images that handles most of the installs for you. If this sounds like something that you would enjoy, click on the AWS Marketplace tab and enter whatever technology you plan on running in this instance. 

![Shopping for an AMI](https://imgur.com/KRMnejX.jpg)

**Things to consider when picking an image from the AMI marketplace**
 - License provided?
 - Free Tier eligible?
 - Available in your region?
If you answered no to any of these, you will be coughing up some dough to the AWS shortly.

**What Instance Type** Instance types vary by memory size and CPU cores. Project specifications require that we use a t2-micro, which comes with a 1gb of RAM, one CPU core, and a couple hundred mB/s of data transfer. That should be plenty for one instance
  - *What about storage size?*, actual HDD or SSD space will be defined by EBS, which stands for Elastic Block Store, not Beanstalk. Confusing, right? We'll get there

---
# Databases

## Launching a database
Let's launch our first instance! To set up your database,

1. Go to the EC2 portal and click *Launch Instance*.

2. Pick an AMI from the marketplace for your desired database. For this tutorial, we will use MongoDB 3.4, but the instructions will be similar for most databases.
  - If you are going to build your db instance from scratch, just leave now. You're expertise exceeds this tutorial

3. Select a t2-micro instance type. Then, skip ahead to Security Groups

4. Make sure you are creating a new security group that enables you to SSH via TCP on port 22 from 'My IP'
  - There should already be a rule for SSH. The only thing that you will need to change is the source. Change it from 'Custom' to 'My IP'
  - Add another rule to expose our database's port to outside traffic. The default port for Mongo is 27017 and 5432 for PostgreSQL. You can set the source to 'My IP' but you will need to add another rule later on to accomodate the IP addresses of your deployed service and proxy.
  - When it's all done, it should look something like this,
**Note: the port in this screenshot is incorrect. the default port for mongo is 27017, NOT 27071!**
![Security Group](https://imgur.com/aoeXHcf.jpg)

5. Create a new key pair, download, keep it secret, keep it safe. This will allow you to SSH into your instance.

![keept it secret](https://media.giphy.com/media/3oFyCYNrra8qo1Cv8Q/giphy.gif)
  -  On Windows, you will need to set explicit permissions for this file. If this file is too open, you cannot SSH with it. [How to set permissions Windows](https://superuser.com/questions/1296024/windows-ssh-permissions-for-private-key-are-too-open). Trev and Jordan, if you encounter this problem, just by a Windows machine, or make a bullet point on how to resolve this issue.

Congrats, you have just created your first EC2 instance! Now it's time to SSH into your Virtual Machine.

## SSH (Secure Shell)

SSHing is the practice of opening a secure TCP connection with the shell on a server. The default port for a SSH is 22.

1. Open your terminal and navigate to the directory that holds your .pem file.
  - In Windows, be sure to run the terminal as an administrator
2. Run `ssh -i ./<fileWithSSHKey>.pem ec2-user@<yourPublicDNS>.compute.amazonaws.com`. You can find your public DNS in your EC2 Dashboard.
  - On OSX, you may need to run `sudo ssh <...>`
  - If all went well, you should see something like this,
![successful SSH](https://imgur.com/kRA06W6.jpg)
  - To exit the shell at anytime, type `exit` and hit enter.
3. If that worked, try typing `mongo` into the shell. Did that work? Great! Now you know enough to be dangerous. To get started, type `db.myCollection.insert({foo: 'bar'})` 10,000,000 times... Hmm, there has got to be a better way of doing this.


## Creating our connection string

SSHing is great for setting up our server and database but we cannot SSH into our server everytime we want to query our database. Instead, we will want to set up a connection string and connect to the port. We already exposed our port. All we need to do is procure a _username_, _password_, _URL_, and that _port_.

1. Lets start with our username and password. In the Mongo shell, enter the following.
  ```
  use myDatabase
  db.createUser(
    {
      user: "morgan",
      pwd: "batman123",
      roles: [
        { role: "readWrite", db: "myDatabase" }
      ]
    }
  )
  ```
2. Next, we need to grab our URL. That will be the public DNS that we used earlier to connect to SSH into the system. That was easy!
3. Lastly, we need to make sure that our port is exposed to the world wide web. We did this earlier when we created the security group. But, if you forgot to do that, *like me*, then you can simply edit the security group from the EC2 dashboard. Add a rule that allows access to your desired port and let everyone access it via TCP.
4. Now lets piece it all together! You have probably seen connection string before but I'll leave it here for your convenience.
  - `mongodb://<USERNAME>:<PASSWORD>@<PUBLIC_DNS>/<DATABASE_NAME>`

Exit the shell and do whatever you want with your new connection string.


## Indexing Your EC2 instance
If you are going to index your database, you should research how the database engine is going to handle a memory shortage. By default, MongoDB does not do anything. 

Mongo allows you to run the index operation the background, which will only use a portion of your machine's total working memory. You can also reduce the space complexity of the index operation by using the parse option. Parse will skip over any documents that do no contain the indexed field. 

Eg: `db.myCollection.createIndex({indexable_field: 1}, {background: true}, {sparse: true}) `

---

# Services
I really do not want to think about this right now.