git "/home/vagrant/openruko/client" do
  user "vagrant"
  group "vagrant"
  repository "https://github.com/openruko/client.git"
  action :checkout
end
