package "expect"

git "/home/vagrant/openruko/keepgreen" do
  user "vagrant"
  group "vagrant"
  repository "https://github.com/Filirom1/orKeepGreen.git"
  action :checkout
end