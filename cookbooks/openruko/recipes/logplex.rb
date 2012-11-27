git "/home/vagrant/openruko/logplex" do
  user "vagrant"
  group "vagrant"
  repository "https://github.com/openruko/logplex.git"
  action :checkout
end

bash "setup-logplex" do
  user  "vagrant"
  cwd   "/home/vagrant/openruko/logplex"
  environment Hash['HOME' => '/home/vagrant']

  code <<-EOF
  make init
  EOF
end

template "/etc/init/openruko-logplex.conf" do
  source "upstart-openruko-logplex.conf.erb"
  owner "root"
  group "root"
  mode 0644
end