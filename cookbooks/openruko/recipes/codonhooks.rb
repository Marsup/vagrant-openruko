git "/home/vagrant/openruko/codonhooks" do
  user "vagrant"
  group "vagrant"
  repository "https://github.com/openruko/codonhooks.git"
  action :checkout
end
