Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "public_network"
  config.vm.network "private_network", ip: "192.168.254.2"
  config.vm.provision :shell, path: "setup/build.sh"
  config.vm.provision :shell, path: "setup/rvm-install.sh", args: "stable", privileged: false
  config.vm.provision :shell, path: "setup/ruby-install.sh", args: "2.4.0 rails", privileged: false
  config.vm.provision :shell, path: "setup/nvm-install.sh", privileged: false
  config.vm.provision :shell, path: "setup/pip-install.sh"
  config.vm.provision :shell, path: "setup/other-user-setup.sh", privileged: false
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
    v.name = "developer"
  end
end
