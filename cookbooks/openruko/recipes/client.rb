git "/home/vagrant/openruko/client" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/openruko/client.git"
  action :checkout
end
