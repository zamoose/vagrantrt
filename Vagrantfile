# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'json'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65puppet"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
  config.vm.hostname = "vagrantrt.dev"
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.synced_folder "trt_data/", "/mnt/trt_data"

  common = File.read('trt_data/hiera/json/common.json')
  common_hash = JSON.parse(common)
  extra = File.read('trt_data/hiera/json/extra.json')
  extra_hash = JSON.parse(extra)

  site_array = []
  common_hash['sites'].each { |site,value|
      site_array += [site]
  }
  if extra_hash.key?('sites')
      extra_hash['sites'].each { |site,value|
          site_array += [site]
      }
  end

  if defined? VagrantPlugins::HostsUpdater
      config.hostsupdater.aliases = site_array
  end

  config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end
  config.vm.provision :puppet do |puppet|
    puppet.module_path = "puppet/modules"
    puppet.hiera_config_path = "hiera.yaml"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "init.pp"
    puppet.options = '--templatedir /vagrant/puppet/files --parser future'
  end
end
