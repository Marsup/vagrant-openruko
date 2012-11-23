git "/home/vagrant/openruko/dynohost" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/openruko/dynohost.git"
  action :checkout
end

bash "setup-dynohost" do
  user  "vagrant"
  cwd   "/home/vagrant/openruko/dynohost"
  environment Hash['HOME' => '/home/vagrant']

  code <<-EOF
  set -e
  make init
  echo | make certs
  EOF
end
