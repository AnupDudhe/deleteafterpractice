
![alt text](image.png)

user - actual person/human that is working on the operating systems. 
shell - to provide enviornment ,cli interface so that user can run / execute 
any commands/app/tool on that interface. (only understands alpha numerical langs)
kernel - kernel is a birdge of communication between your hardware and your user and shell interface ,
its function is to understand the input , excute the input translate the input into binary to the hardware 
and , then the output provided by the hardware is then restranslated into alpha numerical lang from hardware 
which is orginally in binary format. and provide that output to the shell user interface 
hardware - is the acutall physical component that runs the whole system or compute or server ,
various hardwares are ram , cpu , gpu , motherboard , ssd hdds. 


servers : are nothing but high end compute machines (Computers) only 
difference between a pc and a server is this that it has high end of ram , 
cpu , gpu and storage ssd hdd , these servers are used to host various 
webapps , ai's , databases , big data , and majorly these servers are used  or operated on linux based os.

system info commands 
```
free -h
lsblk
df -ht
cat /etc/os-release
date 
cal -3 
cal
```
command manuals  
man ls 
whatis ls 
ls --help

eg 

command syntax 

command -options 
ls - listing of file and folders(directories)
ls -a
cd - change directory 

cd / - changing directory to "/" 
/ -  linux  system  main directory

mkdir - make directory to create folder / directory

mkdir fodername 
mkdir b48

rmdir - remove directory 
to delete the directory 
rmdir b48 

pwd - present working directory 

cat filename - to read a file 

touch filename 

touch b48.txt 

rm - to delete a file 

rm -rf - remove the file recusrive and forcefull 

cd ../ 

cd ../../ 

cd ~ - changes the direcotry postion to users home directory 


home - local user home directory 
root - root user home directory 


lib - for app supporting 32 lib files are stored here
lib64 - for app supporting 64 lib files are stored here 
etc - linux complete configurations files are stored 
bin - has commands / binaries which are accesible to both root and local user 
sbin - has sensitive commands / binares which are only accesible to root user (super user)
media - external usbs will be visibile here  
home - local users home directory (root user can access this directory) 
root - root user home directory ( only root can access this directory)
boot - all the booting related files are stored here 
var - all the linux servers log activities are stored in the location in the form of logs 
dev - locations partitions and terminals 
temp - has linux temp cache files stored 
mnt - to mount additional partitions 
usr - has secondary back of bin  sbin lib lib64 
proc - has process related files and info files of cpu disk etc 
sys - has sytemrelated files like kernel , firmware 
run -  has temp files (runner files)
srv - service files are stored here 

sudo -i    - switches from local to root 
touch /mnt/sample.txt
cp sourcefile destination
cp sample.txt /tmp 

cp /mnt/sample.txt  /var/

mkdir sample
cp -r sample  /tmp


mv sample sampleb44   - rename directories or can be used to move directories 
mv  sampleb44 /tmp

head /etc/passwd
 head -25 /etc/passwd 

tail /etc/passwd
tail -5 /etc/passwd 
tail /etc/passwd 
more /etc/sudoers
cat /etc/passwd
echo "hello"



desktop os -
macos catalina , sonoma { , windows11 , 10 , 8 } ,  
linux based ubuntu , kali 
GUI 
day to day use , notepad , ppt , finance , gaming , coding.
no need expertise 
apart from linux based os , every desktop os is licensed 

server os -  
centos , redhat , suse , ubuntu server  , debian , alpine , oracle linux 
windows 2019 , 2022 , 2025 

CLI 
tech , ai/ml , db server , webservers , appservers mobile server 
expertise and have admin certification , prior knowledge linux and mcsa
apart from windows server os , majority of linux based os are free non licnese. 

VIM
Modes
command
insert
visual 
execution
```
command - to execute commands
left right top bottom arrows - navigation 
h , j , k , l -> navigation
GG - cursor will go from up to down 
gg - cursor will go from down to up 
p - paste lines
esc - mode escape.

yy - single line copy 
nyy   - multiple lines copy
        n = number of lines copy 4yy
yw  - single word copy
nyw  - multiple words copy   , 3yw

dd  - single line is deleted
ndd - multiple lines delete  for eg - 4dd
dw - single word will be delete 
ndw - multiple words will be deleted 3dw



cc  - single line is cut   when cut command is used to also go inside insertmode
ncc - multiple lines cut 
cw - cut single word 
ncw - cut multiple word 3cw

u - undo the unnesary edits.
:!ls / 
:!mkdir /new 
```
```
Insert - to add texts
i - insert mode 
I - insermode 
esc - escape the insert mode 
O - creates space above the present cursoer and insert mode 
o - insertmode and o charter will be insert 
s - insertmode with s inserted 
S - WHOLE line is deleted and insert mode is enabled 
a - insert mode and one line cursor is pushed 
A - inset mode and A is transferred to the end.
```
```
Execution mode  -  to save , execute , quit file , filter out words ,
:   - enter into the execution 
:/root - word can be search and filtering after that if u press
n -> cursor will scroll to that filtered word.   - highlighting
:set nu - numbering to each and every line
19gg - will jump to that particular line in the file
nohl - removes filteration and highlighting
:%s/system/b48/g  -  to replace system word with b48 -we use this command
q - quit
wq! - save and quit forcefully
x - save and quit
```
```
Visual mode 
v  - enter the visual mode
top down bottom left arrow - select the lines u want
c  - cut the selected line
p -paste
y - copy the selected line
d - delete the selected line





```

```
linux user management
root user - UID - 0 - root user 
local user multiples - UID 1000 above  
system user multiples (are not human login , users that are specifically made for system/app/packages and os operations) - UID - 1 - 999

user management configuration files
users meta data available

cat /etc/passwd
dev1:x:1004:1004:,,,:/home/dev1:/bin/bash
 1   2   3   4    5      6        7
1   - username
2  - link of encrypted p/w
3  - uid user id 
4 - gid groupd id 
5 - comments
6 - user home directory
7 - user shell type

 ls -a /etc/skel 
when a user is created following files and directories are affected in linux:-
/etc/passwd
/etc/shadow
/etc/group
/etc/gshadow
home directory /home
/etc/skel -> skeleton copt user home directory /home

adduser dev1 - a dev1 user is created.
passwd username - password reset of user.
usermod -l developer1 dev1  -  rename the username.
usermod -c "this is dev user"  developer1 - give comment
usermod -s /bin/zsh developer1
usermod -m -d /mnt   developer1  - change user's home directory
usermod -u 1008 developer1
usermod -g 1003 developer1
userdel -f username - user will be deleted.

cat /etc/shadow
1             2                                                               3     4  5   6  7 8 
b48:$y$j9T$sWT4LplhkOH70lOSKdseN.$6q6QXWUSWHe6uPbpePcb.u5pbFBBzqfTSRyk8Zb3zYC:20629:0:99999:7: : :

1 - username
2 - encrypted password 
3 - last time since password
4 - minimum password age 20 
5 - maximum password age 30 
6 - Warning day - 28
7 - Inactive days 31
8 - expiry day 32
9 - for future usecase  

chage -M 30 b48
chage -m 16 b48
chage -W 25  b48
chage -d 2026-6-24  b48
chage -I 2  b48
chage -E 33  b48

passwd -M
passwd -x 33 b48
passwd -n 31 b48
passwd -i 2 b48
passwd -e  b48
passwd -w  33 b48

cat /etc/group
1  2    3  4    
dev:x:1002:dev2,dev1
1  - groupname
2 - link of encrpted pass of group
3 - gid
4 - group members


    groupadd dev
    groupadd dev - create a group
    adduser dev1
    adduser dev2
    gpasswd -a dev1 dev  - add users to the group 
    gpasswd dev  - change password of group
    groupdmod -n devloper dev  - change the nae of the group 
    groupmod -n devloper dev
    cat /etc/group
    groupmod -g 1004 devloper  - change gid of the group
    groupmod -g 1005 devloper



cat /etc/gshadow
1                     2                                                                                            3    4 
devloper:$6$3TNAjANMOESZUmrI$mpxTzJ6FghXF.chOs1x150OxwEflWKEuPSvwU8wQqWRbKFJzj3RN577.ZBFICx26Jen/.LNzHfqKn1qWKtL0p0::dev2,dev1
1 - name of the group
2 - password of the group
3 - admin of the group
4 - users list of the group

gpasswd -A root devloper 
gpasswd -A "" devloper

4 engineers -> linux server access -> user1 user2 user3 user4



redirectors

>  -  echo "hello"  > file.txt   - word will be added in file.txt but it will be overwritten if same command is used again 
>>  - echo "hello anup" > file.txt - word will not be overidded and word will be added as well

lt / 2> error.txt  - to add the error but it will overwrite previous one 
lw / 2>> error.txt  - to append the error 

&>  - to add error or output in a file but the error or ouput will be overwritten  
lt &> new.txt
&>>  - to add error or output in a file and it will be appended
echo "new" &>> new.txt 


system defined files vs user defined files 

system defined files 
are those files which are basically used for system usecases , created for os , and its neccessary processes , 
usually created systems , not for normal users.

character files - writes the char by char data in system 
block type file - writes the data in the actual physical drive and partitio
pipe files  - used in intercommunication between two process 
fifo files 


user defined files 

normal text files -  
hardlink - 
softlink - 

vim new.txt 

two commands two different process 

vim -> 1 
text file -> 2 

echo "helllo" > new.txt  

a unique symbolic number assigned to a file - link count 


hardlink vs softlink 
soflinks -
ln -s orginalfilepathwath softlinke_filepathway
softlink can be created of both files and directory 
if oringal file is deleted softlink will be corrupt 

hardlink 

ln orginalfilepathwath hardlink_filepathway
hardlink can be created of only files 
if orignal file is deleted hardlink will not be corrupted


chmod 777 filename.txt
4 - read
2 - write
1 - excute

chmod u=rw filename
chmod u=rw,g=w,o=rwx filename

ls -l
ll        - metadata of files


ls -l -h --block-size=GB /


normal file - link 1 
directory - 2   when ever a file is created within the number will increment by 1 

softlink of file or directory -> both will have link count as 1 

hardlink of file -> will have link as 2

