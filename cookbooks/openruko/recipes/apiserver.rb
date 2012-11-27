git "/home/vagrant/openruko/apiserver" do
  user "vagrant"
  group "vagrant"
  repository "https://github.com/openruko/apiserver.git"
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

bash "setup-postgres" do
  code <<-EOF
  sudo -u postgres psql <<< "CREATE ROLE vagrant PASSWORD 'md5ce5f2d27bc6276a03b0328878c1dc0e2' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN;"
  EOF
end

bash "setup" do
  user "vagrant"
  cwd "/home/vagrant/openruko/apiserver/postgres"
  environment Hash['HOME' => '/home/vagrant']

  code <<-EOF
  sed -i s/\$\(uuidgen\)/ec1a8eb9-18a6-42c2-81ec-c0f0f615280c/ig ./setup
  echo -e "openruko\nvagrant\nopenruko@openruko.com\nvagrant" | ./setup
  EOF
end

template "/etc/init/openruko-apiserver.conf" do
  source "upstart-openruko-apiserver.conf.erb"
  owner "root"
  group "root"
  mode 0644
end