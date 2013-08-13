#!/bin/bash

distro=$(lsb_release -si | tr '[A-Z]' '[a-z]')
arch=$(uname -m)

if [[ $distro == "fedora" ]]
then
	release=$(lsb_release --release --short)
	echo "$distro - $release"
	sudo rpm -ivh http://yum.puppetlabs.com/fedora/f$release/products/$arch/puppetlabs-release-$release-7.noarch.rpm
	echo "rpm -ivh http://yum.puppetlabs.com/fedora/f$release/products/$arch/puppetlabs-release-$release-7.noarch.rpm"
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
