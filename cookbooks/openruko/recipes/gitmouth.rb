git "/home/vagrant/openruko/gitmouth" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/openruko/gitmouth.git"
  action :checkout
end

script "setup-gitmouth" do
  interpreter "bash"
  user  "vagrant"
  cwd   "/home/vagrant/openruko/gitmouth"

  code <<-EOF
  virtualenv --no-site-packages .
  make init
  echo '' | make certs
  EOF
end
