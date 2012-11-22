git "/home/vagrant/openruko/logplex" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/openruko/logplex.git"
  action :checkout
end

script "setup-logplex" do
  interpreter "bash"
  user  "vagrant"
  cwd   "/home/vagrant/openruko/logplex"

  code <<-EOF
  npm install
  EOF
end
