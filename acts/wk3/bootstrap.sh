#!/bin/bash
exec 2>&1 > /tmp/bootstrap
sudo apt-get update

#  for puppet master create /etc/puppet/manifests/site.pp
# this is client

sudo apt-get install --yes puppet

# set puppet master by server = puppet.master.ip
# for master; service puppetmaster start

# to start puppet on reboot

sed -i.bak -e /START/s/no/yes/ /etc/default/puppet
service puppet start 

# client need to sign the certificate
# check certificate on master by puppet cert --list; 
# sign the certificate on master by puppet cert --sign fed1.aditya.pa

# create ec2
#ec2-run-instances -z us-east-1a -t t1.micro -g bootcamp ami-f9b0e590 -k tracy1

