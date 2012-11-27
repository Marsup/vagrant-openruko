git "/home/vagrant/openruko/dynohost" do
  user "vagrant"
  group "vagrant"
  repository "https://github.com/openruko/dynohost.git"
  action :checkout
end

bash "setup-dynohost" do
  user  "vagrant"
  cwd   "/home/vagrant/openruko/dynohost"
  environment Hash['HOME' => '/home/vagrant']

  code <<-EOF
  set -e
  make init
  echo -e '\n\n\n\n\n\n' | make certs
  EOF
end

template "/etc/init/openruko-dynohost.conf" do
  source "upstart-openruko-dynohost.conf.erb"
  owner "root"
  group "root"
  mode 0644
end