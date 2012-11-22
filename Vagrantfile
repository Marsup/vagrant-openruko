# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "openruko"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Leave this as a separate part, it allows chef
  # to reload its env on the next part
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = 'cookbooks'

    chef.add_recipe 'proxy'
    chef.json = {
      :proxy => {
        :http_proxy => ENV['HTTP_PROXY'],
        :https_proxy => ENV['HTTPS_PROXY'],
        :no_proxy => ENV['NO_PROXY']
      }
    }
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = 'cookbooks'

    chef.add_recipe 'apt'
    chef.add_recipe 'build-essential'
    chef.add_recipe 'openssl'
    chef.add_recipe 'postgresql::client'
    chef.add_recipe 'postgresql::server'
    chef.add_recipe 'git'
    chef.add_recipe 'nvm'
    chef.add_recipe 'openruko'
    chef.add_recipe 'heroku-toolbelt'

    chef.json = {
      :postgresql => {
        :version  => "9.1",
        :listen_addresses => "*",
        :hba => [
          { :method => "trust", :address => "0.0.0.0/0" },
          { :method => "trust", :address => "::1/0" },
        ],
        :password => {
          :postgres => "password",
          :vagrant => "vagrant"
        }
      }
    }
  end

  # Dir.glob('./scripts/post/*.sh').sort.each do |item|
  #   next if item == '.' or item == '..'
  #   config.vm.provision :shell do |shell|
  #     shell.path = item
  #   end
  # end
end
