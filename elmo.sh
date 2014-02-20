#!/bin/bash

which lsb_release > /dev/null 2>&1 || echo "pl0x install lsb_release" && exit 1

distro=$(lsb_release -si | tr '[A-Z]' '[a-z]')

if [[ $distro == "fedora" ]]
then
	release=$(lsb_release --release --short)
	echo "$distro - $release"
	sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-$distro-$release.noarch.rpm
	echo "rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-$distro-$release.noarch.rpm"
	sudo yum update install puppet
elif [[ $distro == "centos" ]]
then
	release=$(lsb_release --release --short | cut -d '.' -f 1)
	echo "$distro - $release"
	sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-$release.noarch.rpm
	echo "rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-$release.noarch.rpm"
	sudo yum update install puppet
elif [[ $distro == "debian" ]] || [[ $distro == "ubuntu" ]]
then
	release=$(lsb_release --codename --short)
	echo "$distro - $release"
	wget http://apt.puppetlabs.com/puppetlabs-release-$release.deb
	echo "http://apt.puppetlabs.com/puppetlabs-release-$release.deb"
	sudo dpkg -i puppetlabs-release-$codename.deb
	sudo apt-get update
	sudo apt-get install puppet-common
else
	echo "Distro othekkt"
	exit 0
fi

sudo puppet apply --modulepath $(pwd)/modules -v $distro.pp
