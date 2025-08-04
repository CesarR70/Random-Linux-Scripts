#!/bin/bash
#Note: These variabes are what was configured on my home server, but feel free to adjust them to meet your needs

ShareDir="/mnt/media/"
FileOwner="owner" #Ideally this should be the system admin (However, it must be a user that already exists on the system)
ShareUser="share" #The name of the account used to login for file sharing
ShareGroup="mediashare" #The name of the group that will have share permissions

#Create directory for sharing files (if not already done)
echo "Creating share directory on: $ShareDir"
sudo mkdir -p "$ShareDir"

#Create share user account (if not already done)
echo -e "\nCreating new user to be used for smb sharing. NAME= $ShareUser"
sudo adduser --system --no-create-home "$ShareUser" #remove system & no-create-home if this is a standard user that can login to a desktop/terminal

#Define new share user as a Samba User as well
echo -e "\nSetting samba permissions for new share user"
sudo smbpasswd -a "$ShareUser"

#Adjust filesystem permissions (setup groups)
echo -e "\nConfiguring share group and permissions"
sudo groupadd "$ShareGroup" #create new group for sharing
sudo usermod -aG "$ShareGroup" "$FileOwner"
sudo usermod -aG "$ShareGroup" "$ShareUser"

#Assign the directory's group and permissions
sudo chown -R "$FileOwner":"$ShareGroup" "$ShareDir"
sudo chmod -R 750 "$ShareDir"
sudo chmod g+s "$ShareDir"

#Restart Samba and smbd services
echo -e "\nRestarting samba services"
sudo systemctl restart smbd

echo "All Done!"

##Dont forget to add the following to /etc/samba/smb.conf (remove comment symbols)...

#[MediaShare]
#comment = Media Share folder
#path = /mnt/Media
#veto files = /lost+found
#valid users = share, cesar
#read only = yes
#write list = owner
#browsable = yes
#create mask = 770
#directory mask = 0771
#public = no
#guest ok = no
#printable = no
