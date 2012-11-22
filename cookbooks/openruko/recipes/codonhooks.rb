git "/home/vagrant/openruko/codonhooks" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/openruko/codonhooks.git"
  action :checkout
end
