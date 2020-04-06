# Give root permisons to the current user 
# from https://devconnected.com/how-to-add-a-user-to-sudoers-on-debian-10-buster/
su
user=whoami
sudo usrmod -a -G sudo $user
exit
