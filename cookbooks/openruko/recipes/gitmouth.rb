git "/home/vagrant/openruko/gitmouth" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/openruko/gitmouth.git"
  action :checkout
end

bash "setup-gitmouth" do
  user  "vagrant"
  cwd   "/home/vagrant/openruko/gitmouth"
  environment Hash['HOME' => '/home/vagrant']

  code <<-EOF
  set -e
  virtualenv --no-site-packages .
  make init
  rm -fr certs
  echo '' | make certs
  EOF
end
