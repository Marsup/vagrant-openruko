package "curl"

script "install-nvm" do
  interpreter "bash"
  user  "root"
  cwd   "/usr/local/bin"

  code <<-EOF
    git clone http://github.com/creationix/nvm.git
    source /usr/local/bin/nvm/nvm.sh
    nvm install 0.8
    nvm alias default 0.8
    npm config set --global registry http://registry.npmjs.org/
  EOF

  not_if "test -d /usr/local/bin/nvm"
end

template "/etc/profile.d/nvm.sh" do
  source "nvm.erb"
  owner "root"
  group "root"
  mode 0755
end
