git "/home/vagrant/openruko/httprouting" do
  user "vagrant"
  group "vagrant"
  repository "https://github.com/Filirom1/httprouting.git"
  action :checkout
end

bash "setup-httprouting" do
  user  "vagrant"
  cwd   "/home/vagrant/openruko/httprouting"
  environment Hash['HOME' => '/home/vagrant']

  code <<-EOF
  set -e
  make init
  echo -e '\n\n\n\n\n\n\n\n' | make certs
  EOF
end

template "/etc/init/openruko-httprouting.conf" do
  source "upstart-openruko-httprouting.conf.erb"
  owner "root"
  group "root"
  mode 0644
end
