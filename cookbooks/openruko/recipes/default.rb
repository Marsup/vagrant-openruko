package "curl"
package "wget"
package "socat"
package "postgresql-server-dev-9.1"
package "postgresql-contrib-9.1"
package "uuid-dev"
package "libssl0.9.8"
package "python"
package "python-dev"
package "python-virtualenv"
package "lxc"

directory "/home/vagrant/openruko" do
  owner "vagrant"
  group "vagrant"
  mode 0755
end

template "/etc/profile.d/openruko.sh" do
  source "profile-openruko.erb"
  owner "root"
  group "root"
  mode 0755
end

template "/etc/init/openruko.conf" do
  source "upstart-openruko.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

include_recipe "openruko::gitmouth"
include_recipe "openruko::apiserver"
include_recipe "openruko::httprouting"
include_recipe "openruko::dynohost"
include_recipe "openruko::logplex"
include_recipe "openruko::rukorun"
include_recipe "openruko::codonhooks"
include_recipe "openruko::client"
include_recipe "openruko::keepgreen"

service "openruko" do
  provider Chef::Provider::Service::Upstart
  supports :restart => true, :start => true, :stop => true
  action [:enable, :start]
end
