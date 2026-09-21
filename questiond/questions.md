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
 

```
