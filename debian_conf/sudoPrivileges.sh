# Give root permisons to the current user 
# from https://devconnected.com/how-to-add-a-user-to-sudoers-on-debian-10-buster/
su
user=whoami
sudo usrmod -a -G sudo $user
exit


# If wireless connection is required it is neccessary to be able to connect to non-free repository 
# After install iwlwifi package for intel wifi controller
# https://wiki.debian.org/iwlwifi
