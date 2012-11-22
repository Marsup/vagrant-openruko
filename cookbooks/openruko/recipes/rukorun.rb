git "/home/vagrant/openruko/rukorun" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/openruko/rukorun.git"
  action :checkout
end

script "setup-rukorun" do
  interpreter "bash"
  user  "vagrant"
  cwd   "/home/vagrant/openruko/rukorun"

  code <<-EOF
  npm install
  EOF
end
