git "/home/vagrant/openruko/logplex" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/openruko/logplex.git"
  action :checkout
end

bash "setup-logplex" do
  user  "vagrant"
  cwd   "/home/vagrant/openruko/logplex"
  environment Hash['HOME' => '/home/vagrant']

  code <<-EOF
  npm install
  EOF
end
