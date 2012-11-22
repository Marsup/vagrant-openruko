git "/home/vagrant/openruko/dynohost" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/openruko/dynohost.git"
  action :checkout
end

script "setup-dynohost" do
  interpreter "bash"
  user  "vagrant"
  cwd   "/home/vagrant/openruko/dynohost"

  code <<-EOF
  make init
  echo | make certs
  EOF
end
