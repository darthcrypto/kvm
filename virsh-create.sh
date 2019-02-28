#!/bin/bash


#launch a vm
virt-install --name=template-64g \
--vcpus=4 \
--memory= \
--cdrom=/tmp/debian-9.0.0-amd64-netinst.iso \
--disk size=5 \
--os-variant=debian8


###install kvm

###local install ansible
https://www.linuxschoolonline.com/how-to-install-ansible-offline-on-centos-or-redhat/


####install a vm via automated kickstart
virt-install -n domain-controller.stuff.net \
-r 2048 \
--disk path=/var/lib/libvirt/images/domain-controller.stuff.net,size=64 \
-l http://192.168.56.254/iso/ \
-x ks=http://192.168.56.254/ks/domain-controller.ks


#domain-controller ks
wget -O ansible-packages
yum localinstall -y python-crypto2.6-2.6.1-2.el6.x86_64.rpm python-httplib2-0.7.41.el6.art.noarch.rpm python-jinja2-26-2.6-3.el6.noarch.rpm python-keyczar-0.71c 1.el6.noarch.rpm sshpass-1.05-5.el6.art.x86_64.rpm

touch /tmp/.ready

#wait for vm to launch
while true
do
  ssh user@remote.no-exist.com 'ls /tmp/.ready' > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
      echo "the job is done"
      exit
  else
     echo [INFO] Sleeping for 5 secs
     sleep 5;
  fi
done

