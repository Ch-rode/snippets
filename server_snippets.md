### CREATE A GROUP TO CHANGE FOLDER'S PERMISSIONS
1. create a group and add users to the group
```
# groupadd shared
# usermod -aG shared bob
# usermod -aG shared alice
 ```
2. Recursively change group folder ownership:
 ```
 # chgrp -R shared /data
 ```
3. Adding reading, writing and executing (only for files already executables) permissions for the group shared:
 ```
 # chmod -R g+rwX /data
 ```

 ```
sudo chown -R <username>: <folderName>
sudo chown -R lazars:temberturegroup /home/lazars
setfacl -R -m u:<username>:rwx <Folder/File>
 ```
### ADD A USER
```
sudo useradd user_name
sudo passwd user_name
```
### How to kill the GPU based on the PID from nvidia-smi output 
`sudo kill -9 PID`  
i.e.: `sudo kill -9 2425494`
![image](https://github.com/Ch-rode/snippets/assets/61243245/4f05fe6b-bae9-4247-869e-41f6f0dcb977)

### Mount a folder from another server (using nfs0 
open `/etc/fstab` and add, i.e.:  
```
8.8.8.8:/data2               /mounted_data2      nfs nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
```  
than change the permissions to `nobody` user.

### Sync the users ID between two different machine: 
It simply requires to manually edit
```
/etc/passwd
/etc/group
```
Such that the uid and gid on server1 matches the ones on server2. 

### SCANCEL range of jobs
`for i in $(seq 1000 1010); do scancel $i; done`

### Change SLURM job dependency
`scontrol update job=199554 dependency=""`

### SSH reboot server
`sudo reboot now`

### Install package on Rocky Linux
`sudo dnf -y install wxGTK3-devel`
`sudo dnf -y install clustal-omega`

