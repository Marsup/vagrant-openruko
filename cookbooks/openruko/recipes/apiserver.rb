git "/home/vagrant/openruko/apiserver" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/openruko/apiserver.git"
  action :checkout
end

bash "setup-apiserver" do
  user  "vagrant"
  cwd   "/home/vagrant/openruko/apiserver"
  environment Hash['HOME' => '/home/vagrant']

  code <<-EOF
  set -e
  make init
  echo -e '\ny' | ssh-keygen -t rsa -N ''
  EOF
end
