```
scenario based questions on linux and aws 


Linux 



user management 
difference between a sudo user vs local user vs root user 

sbin and bin 
commands packages 

configuration file of sudo.

assuming a user needs a special permission for a particular command rm -rf , but i add sudo infront of that command i am still 
not able to execute that command.

local user ==> convert into sudo user ==> sudoers 

can i only give access of only one or two commands via sudoers ? Yes 
All (All) all 


what are roles of skeleton files and if i delete them how to recover them ? 
/etc/skel ==> /home/ubuntu --> .skel deleted ? 
/etc/skel ==> cp into users home directory 

difference between rmdir vs rm -rf 

permission management 
users => permissions 

can you please a permission to user called as ubuntu as rw  to a directory called as database 
where as other will have read only and root as well will have rwx ,can you give me command , group - r 

chmod   database 

what is the usecase of chgroup commmand  (login into group) ? 

how to change shell of my os ? 
chsh -> change shell 

types of shells available and how to list them out give me commands ? 
 
differnce between alphabetical vs numerical permision management ?
chmod 777 - numerical 
chmod rwx-wx-rw - alpha  

list out all the 19 directories and what if i have deleted once such 19 directory called as tmp , etc is it possible recovery ? 
how to avoid these situations where i can keep ensuring backups ? 
cron job directories arch and compression on a periodic basis to maintain timely backups of sensitive directories. 


log management and process management 

fileds of top command ? 

i have process id called as apiworker -> pid is 999 -> i want to increase it priority how to do that ? 
renice 

difference between htop command vs top.

what is zombie process ? also how to kill a process ? types of process 

what will happen if do kill -12 or kill -13 command 19 oe 15 or 9 ?

difference between ps -elf vs top 

only devs linux machine he was running a foregroud process and killed it but now hes is again trying to 
execute same foreground process but that process is not facing a errror claiming that this process cant be executed 
since the port is already aquired.

lsof 

foreground vs background process ?

daemon process name of ssh ? apache http , nginx ?

systemctl status usecase and other commands ?
reload start stop status ?

journalctl command usecase -> processes Logs can be checked


partition management 

types of partition management 

command or steps to partition a 120GB of volume into 2 partiions of 60 - 60 
usecase of /dev ? 

is it possible to extend size of existing partiton ? yes with the parted 

fdisk => n command ? m command 


ssh protocol , networking etc.

private key client side - server side  ?

port numbers of ssh , nfs , http , mysql , mdb , postgre , mongodb , https , ftp , tomcat java 

what are 7 layers of osi model where does lan rj45 cable stands in osi ?
software application
security group of aws ?

what are protocols in networking ? tcp 

public ip vs private ?
 
bit of ipv4 , ipv6 and macaddress

32b , 128b , 48b

udp vs tcp 

smtp ?
 

#aws 

ec2 -> 
type of virtualizer ec2 uses ? 
how many security groups can be attached to a instance at once ? 
how wany network interface cards can be attached to a instance ? 
can i increase volume while instance is in running condition ?
can i decrease volume while isntance is in running condition ? 
can i change instace type while instance is in running conditions ?
can i decrease instances ram and cpu as well ?

i am having a banking application , via that application lots of transaction happens ?
can you tell shall i go general type instance or cpu or memory optimised instance type ?

tell me instance type available in aws ?

virtualizer ? 
 
2/3 1/4 or 2/4 -> instance health status checks 
how will you trouble shoot ?

how to automate timely instance backups ?

if u login into aws tell me what is the first screen that u see 
and describe me the console. 


i have instance t4 and i would to save some costing is their a way to it ?
purchase types ,

difference between snapshots vs ami ? 
can i save my costing via snapshots only ? 

what is data transfer ? 

volume type ? i only store my older backups in a instance tell me which volume type shall i use 
i would not like to incur charges for unnesary heavy disks i am only using them for backups.

ssd or hdd 
ssd - io gp 
hdd -> cold hdd through opti hdd 

magnetic tape.

s3 storage types ?

aws storage types ? 
object type (s3) 
block storage (ebs)
file system (efs) 

iops vs throughput ? 

what is iops and what is throughput ?

types of scaling ? 

i have a running machine 24/7 but at a time period my machines instance type needs to changed ? 
so while im switching instance type is this vertical scaling or horizontal scaling ?
how can i automate it is it possible ?

asg types , lb types ? 

lb algo types ? vs  lb types ?

which algo aws lb uses ?

on which osi layer does network balancer ? 
on which osi layer does app balancer ?

s3 ? 
scenarios i have a storage backup app , where all the users store their backups 
is it possible to use aws and which aws service ? 

can you s3 storage types , also is theri a way to automate storage shift from one
tier to another , lifecycle 

my app is hosted on s3 ? but i have used from us as well as india , my s3 is in india 
but my us users are facing latency issue buffering how to resolve this ?

transfer acceleration 

i have a compliancy in that compliancy i would like to ensure to keep backup of my s3 bucket as a replica ? also is it posisble on cross account ?
aws s3 replica 
 
versioning ? worm object lock ? 

can i give granular filter access to my storage to user ? 


VPC  ?

nat gateway ? igw ? 

what is vpn solution how to set site to site vpn and point to site vpn in aws ?
number of vpcs to be created at once  ? 

vpc region based or az ?
subnet region based or az ?

route table usecase ?  
diff between sg vs vpc acl ? 
public vs private ranges lists out ? 

iam  ?

federated users in aws ? 
role ? 
cli login ? 
iam indentiy provider ? 

policies read only ? types of polices ?

groups vs user difference ? 


RDS ?
engine types in rds 
current version of the database ur were using in previous org ? 
eks version of k8s in previous org ? 
how to patch ur databse or update them ? 
setup automation of db via snapshots? 
restoration of db via snapshots ? 

read replica concept in rds (multi region readreplica)
multi az databse setup ? 

r53 routing policy types 
how to block content in a region via cloudfront ?

-------------------------------------------------------------------------------

Devops 
Git and remote repo 

git lifecycle commands ?
diff between distri vcs vs cent vcs ? 
is git which type vcs ? 

diff between rebase vs revert ?

what is git cherry pick ?

diff between public repo vs private ?

github ee vs ce difference ? 
github actions ? 
gitlab ci/cd pipeline?

----------------
docker 

ecr vs dockerhub ?
previous org used which registry to save image version ? 
diff between arg vs env 
copy vs add 
entrypoint vs cmd 
how to deploy a node js based app on docker can you write me a dockerfile ?
docker containcer running lifecyle command brief them ? 
explain port mapping ? is their a way expose ?
docker networking types ? 
docker exec usecase ?

docker run inst ?
alpine as a base image in docker ? 

-------------------
k8s 

brief me complete k8s architecture ? 
what were objects used in k8s for deploying ur app in previous org ?
replica set vs replica controller diff ? 
write me a k8s manifest file for pod ? 
what is helm chart ? 
all the objects you knowledge ?

which ingress were u using in previous org ?
kong istio nginx apache 

https://lenshq.io/blog/fix-common-kubernetes-errors/ ? 

what are readiness and live probes ? 

rbac , is their a way to setup polcies ?

networking blokcing on k8s level ? 

-----------------
tf 

tf blocks that were used ?
tf module usecase ? 
tf module heirarchy ? 
tf remote access file of tf state ? 
what is backend block ? 

what are provisioners blocks ? 

tf recovery ? if i deleted a tf file how to recover those files ?
tf state -> json -> conversion -> tf state file restoration 

describe all the tf blocks ? 

loops in tf ? 

write me tf to create a s3 bucket or ec2 instance ?

-----------------------------
jenkins ? 

explain jenkins architecture previous orgs /
what were the plugins used in jenkins ?
what was ur be and fe source code heirarchy describe 
usecase of js based source heriarchy 
npm build 
maven lifecycle 
pom.xml ? 
package ? 

scripted based jenkins file ? declariative ? 

write me a simple jenkins file to execute a simple react based deployment 
with 4 stages 

is it possible to write a jenkins file in YAML scripting lagn ? 

how do you patch jenkins ? of extensions ?

----------------------------------
SLO vs SLA
how did u monitor k8s cluster ?
alert and pager setup on datadog ?
billing alert setup on datadog 


```
