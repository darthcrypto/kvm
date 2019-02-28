#!/bin/bash

##########big kickstart file for hardware


#launch a vm
virt-install --name=template-64g \
--vcpus=4 \
--memory= \
--cdrom=/tmp/debian-9.0.0-amd64-netinst.iso \
--disk size=5 \
--os-variant=debian8

-----after initial provision
###ssh to ansible server and run playbook to setup kvm on the server##########



####install a vm via automated kickstart
virt-install -n domain-controller.stuff.net \
-r 2048 \
--disk path=/var/lib/libvirt/images/domain-controller.stuff.net,size=64 \
-l http://192.168.56.254/iso/ \
-x ks=http://192.168.56.254/ks/domain-controller.ks

#inside the the ks of every server:
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

########once all VMs are launched:
ssh to ansible server and run playbooks
	-domain
	-blah
	-blah

