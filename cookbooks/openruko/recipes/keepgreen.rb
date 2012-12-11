package "expect"

git "/home/vagrant/openruko/keepgreen" do
  user "vagrant"
  group "vagrant"
  repository "https://github.com/openruko/integration-tests.git"
  action :checkout
end