# Morgan's Super Awesome EC2 Guide!

In this guide, you will learn how to deploy your database, service, and proxy to a raw EC2 instance. [Well isn't that neat!](https://www.youtube.com/watch?v=Hm3JodBR-vs)
---
# Sections
1. [Considerations and Groundwork](#Groundwork)
1. [Setting your database](#Databases)
1. [Deploying your service](#Services)
1. [Using a load balancer](#Load-Balancer)
1. [Deploying your proxy](#Proxies)
1. [Resources](#Resources)

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

**What Instance Type** Instance types vary by memory size and CPU cores. Project specifications require that we use a t2-micro, which comes with 1gb of RAM, one CPU core, and a couple hundred mB/s of data transfer. That should be plenty for one instance
  - *What about storage size?*, actual HDD or SSD space will be defined by EBS, which stands for Elastic Block Store, not Beanstalk. Confusing, right? We'll get there

**What is a load balancer?** A load balancer can do a couple of things but its primary function is distributing requests in a sensible way across a cluster of servers. Think of it as the TSA agent at airport security who tells you which line to enter. The agent will direct traffic in such a way that want line does not get overwhelmed with traffic.

There are two types of load balancers, *active-passive* and *active-active*. Active-passive involve a chain of servers whereby one server take all of the traffic until they are at capacity. When they reach capacity, they forward traffic on to the next server in the chain. Active-passive load balancers are sometimes referred to cascading load balancers or failover servers. Active-active load balancers evenly spread the traffic across a cluster of servers. Most of the time, it will use a round robin scheduling algorithm. 

In the airport security example, an active-passive load balancer will fill up one line before opening another line up and directing traffic to the new line. An active-active load balancer would have all lines open and distribute traffic in such a way that the queue in each line took the same amount of time. The active-passive will be more cost effective because the airport will have to employ fewer TSA agents but the wait time will be longer. If speed is an important feature, one should opt for an active-active load balancer. 

Because speed is the primary feature of our SDC, we will be implementing an active-active load balancer. If you are careful with your instance, the cost of the instances will not exceed your free tier hours.

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
  - Add another rule to expose our database's port to outside traffic. The default port for Mongo is 27017 and 5432 for PostgreSQL. You can set the source to 'My IP' but you will need to add another rule later on to accommodate  the IP addresses of your deployed service and proxy.
  - When it's all done, it should look something like this,
**Note: the port in this screenshot is incorrect. the default port for mongo is 27017, NOT 27071!**

![Security Group](https://imgur.com/aoeXHcf.jpg)

5. Click 'Review and Launch', then 'Launch'!

6. You will be prompted to pick a key/value pair. Create a new key pair, download, keep it secret, keep it safe. This will allow you to SSH into your instance.

![keep it secret](https://media.giphy.com/media/3oFyCYNrra8qo1Cv8Q/giphy.gif)

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

1. Let's start with our username and password. In the Mongo shell, enter the following.
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

Mongo allows you to run the index operation the background, which will only use a portion of your machine's total working memory. You can also reduce the space complexity of the index operation by using the parse option. Parse will skip over any documents that do not contain the indexed field. 

Eg: `db.myCollection.createIndex({indexable_field: 1}, {background: true}, {sparse: true}) `

---

# Services 

For the sake of time and space complexity, we are going to assume that you have read the prior sections. In this section we will talk about how to deploy one instance of a service. We will refer to this guide as an abstraction later on when we talk about our load balancer.

## Creating and configuring your EC2 instance 

Let's just jump right into things.

1. Lets launch an instance just like before. For our AMI, let's go with just a vanilla AMI. The Amazon Linux 2 AMI has a lot of good support, articles, and stack overflow posts. Let's select that.
2. Instance type will be a t2.micro again.
3. Jump ahead to security group. Like before, you will want to add 'MyIP' as a source. Then add two rules. One for port 80, where we will receive requests to server, and one port for your service, the port that your server is listening to (eg. 3001). Set the source to anywhere for both ports.
4. Review, launch the instance, create a key/value pair and store it somewhere safe.

That was pretty straightforward. Now let's get installing!


## SSH and Shop for Packages!

Now that we have our instance set up, we can SSH into our instance and start downloading some stuff! On our shopping list today is _node-version-manager_, _node_, _git_, and _Nginx_.

1. SSH into your instance like before.
  - For your convenience, `ssh -i ./<fileWithSSHKey>.pem ec2-user@<yourPublicDNS>.compute.amazonaws.com`
  - [and the post for setting permissions](https://superuser.com/questions/1296024/windows-ssh-permissions-for-private-key-are-too-open) 
2. Once you are in there, let's get node going!
  - First, install NVM (Node Version Manager), `curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash `.
  - Restart your shell to make use of NVM.
  - Then, run `nvm install node <yourPreferredVersionOfNode>`. If you want to install the latest version of node, omit the version from the command. It is unlikely that a newer version of Node will break your code, but it is good practice to deploy with the version of node that you developed with. To see what version of Node you are using, run `node --version` on your own computer.

Congrats, you installed Node on a box in the cloud! Your results will look like this,

![successfully deployed node](https://i.imgur.com/7VxL59F.jpg)

3. Let's install git! Run `sudo yum install git`. No sweat, right?!
4. Take note of your `pwd` and `git clone https://github.com/<yourUsername>/<yourKickAssRepo>.git` your service from github.

Now that you are all set up, remember to `npm install`, create your env file, and do whatever set up you need. To see your results, navigate to <yourPublicDNS>:<yourPortNumber>. If you have whacked all the moles, you should see your service! Exciting, right?!

![Service Running](https://imgur.com/M8oaOjE.jpg)


## Starting your server and keeping it running

Now, close your terminal and try to access your service again. You will be greeted with a nice little error message. Take a second to ponder why this is, what this means for our server, and how we should think about running our server on EC2 instance. 

Let's tackle the *why* first. Our server is having separation-anxiety. Without us, it is a useless, nervous wreck. We can go about this in a couple of ways. The first would be to start it up in the background as a service. This is great because it can go about its day without any oversight. We just need to hit start and walk away.

As good as this seems, it has one major issue. What if our server trips on a rock and scrapes its knee or loses its wallet during a heavy night of drinking? Our server does not have any life experience or any way to learn from life experiences. So, we need a process manager.

A process manager will restart our server after a crash, perform git pull requests when there is a newer version of our service, run scripts before starting the server, and so much more! The process manager will be like a nanny for our server. Our server may still get some separation-anxiety  from time to time and need some new lessons from time to time but our nanny, the process manager, will be good enough 99% of the time.

I guess we tackled the *what* and *how* questions with that absurd analogy. So, let's dive into the process manager. For this guide, we will be using [PM2](https://pm2.io/doc/en/runtime/overview/?utm_source=pm2&utm_medium=website&utm_campaign=rebranding). There are plenty of good alternatives, such as [Strong Loop](https://strong-pm.io/) and [Forever](https://github.com/foreversd/forever). Do your own research and find the process manager that fits your needs.

1. To get started with PM2, SSH back into your instance and run `npm install pm2 -g`
2. Then navigate to the root level of your directory and run `pm2 start <thePathAndNameOfYourServerFile>`. If all goes well, you will see something like this,

![PM2 started](https://imgur.com/lIouGkL.jpg).

3. Now, exit your SSH and open up your service in your web browser. Did everything load? Great! Before you move forward, you should pay a visit to the PM2 docs and dig into the `pm2` commands. [Here is a good starting point](http://pm2.keymetrics.io/docs/usage/process-management/). Here is a little cheat-sheet for your convenience:

| Command  | Description  |
|---|------|
| `pm2 start <appName>.js --name MyApp` | Starts the process and designates it the name 'MyApp' |
| `pm2 stop <appName>.js` | Stops the process |
| `pm2 delete <appName>.js` | Deletes the process. Can be performed while the process is running |
| `pm2 restart <appName>.js` | Restarts the app |
| `pm2 list` or `pm2 ls`| List all of the running processes |
| `pm2 show 0` | Shows more detailed information about process |
| `pm2 start memoryHungryServer.js --max-memory-restart 20M` | restarts the process with maximum memory allotment |


You now have all the tools that you need to set up a node server. These same principles will apply to the proxy but, before we can talk about proxies, we need to tackle load balancers first!


# Load Balancer

For this tutorial, we will be using Nginx to implement an active-active load balancing. Like the last section, we are going to assume that you have read the prior sections or, at the very least, have a basic understanding of the things being discussed. With that out of the way, let's jump right in!

*Updated at 3:30pm on June 13, 2019*


1. Create another t2.micro instance with an Ubuntu AMI and expose port 80.
  - You cannot run Nginx with Amazon Linux distro. Nginx recommends Ubuntu.
  - For ubuntu, your SSH command will be slightly different. Instead of `... ec-user@<publicDNS>`, your username will be 'ubuntu. So, you would write `... ubunutu@<publicDNS>`. 
2. SSH into your instance, update everything and install Nginx.

```
sudo apt update
sudo apt install nginx

```
  - Now navigate to your load balancer's public DNS in your browser. Do you see this splash page? Awesome! As the splash page suggests, we need to configure some files.

![Nginx Splash Page](https://imgur.com/ZLOCb9F.jpg)

3. Let's `cd /etc/nginx/sites-available` and `sudo vim default`. In this file we will be inserting an upstream directive and updating the location to use that directive. 

The upstream directive 

```
upstream myFancyApp {
  least_conn; 
  server <yourService'sPublicDNS>:<yourPort>
}
```

The Updated Location 

```
server {
  ...
  location / {
    proxy_pass http://myFancyApp
  }
  ...
}
```

[Example](https://imgur.com/oGTzCh9.jpg)
  - Right now we only have one upstream. When we add in other upstreams, Nginx will use a the least connected algorithm to distribute traffic. If you omit `least_conn;`, Nginx will default to a round robin distribution.

4. Almost done! Just restart the service with `sudo service nginx restart` and go back to the EC2 portal.
5. Select your load balancer, find it's security group, and add an outbound rule with the type 'All Traffic'. Take a guess what we are doing here. Okay, that was kind of a gimme. We are making our load balancer internet facing! Grab the load balancer's public dns, open a new tab, and plop it in the address bar. 🧙‍ Magic 🧙‍

![Empty Service](https://imgur.com/j6lM3pt)

This may be more exciting for some. As you may have noticed, we are not pulling anything in from the database. That's an easy fix.

6. Go back to your security group and add an inbound rule for your database.


# Resources

[Super awesome resource that helped me write Service guide](https://medium.com/@nishankjaintdk/setting-up-a-node-js-app-on-a-linux-ami-on-an-aws-ec2-instance-with-nginx-59cbc1bcc68c)

[Nginx.org docs for HTTP load balancing](http://nginx.org/en/docs/http/load_balancing.html)

[The amazing Nginx docs that should be the gold model of documentation](https://docs.nginx.com/nginx/deployment-guides/amazon-web-services/ec2-instances-for-nginx/)


# Credits

- Jordan Boles, grammar strategist