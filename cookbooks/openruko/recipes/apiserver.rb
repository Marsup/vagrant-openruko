git "/home/vagrant/openruko/apiserver" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/openruko/apiserver.git"
  action :checkout
end

script "setup-apiserver" do
  interpreter "bash"
  user  "vagrant"
  cwd   "/home/vagrant/openruko/apiserver"

  code <<-EOF
  make init
  ssh-keygen -At rsa
  EOF
end
