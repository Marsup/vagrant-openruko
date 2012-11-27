git "/home/vagrant/openruko/gitmouth" do
  user "vagrant"
  group "vagrant"
  repository "https://github.com/openruko/gitmouth.git"
  action :checkout
end

bash "setup-gitmouth" do
  user  "vagrant"
  cwd   "/home/vagrant/openruko/gitmouth"
  environment Hash['HOME' => '/home/vagrant']

  code <<-EOF
  set -e
  if [ ! -f ./bin/activate ]; then
	virtualenv --no-site-packages .
	make init
  fi
  rm -fr certs
  echo '' | make certs
  EOF
end

template "/etc/init/openruko-gitmouth.conf" do
  source "upstart-openruko-gitmouth.conf.erb"
  owner "root"
  group "root"
  mode 0644
end