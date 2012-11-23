git "/home/vagrant/openruko/rukorun" do
  user "vagrant"
  group "vagrant"
  repository "git://github.com/openruko/rukorun.git"
  action :checkout
end

bash "setup-rukorun" do
  user  "vagrant"
  cwd   "/home/vagrant/openruko/rukorun"
  environment Hash['HOME' => '/home/vagrant']

  code <<-EOF
  npm install
  EOF
end
