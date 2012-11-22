if node['proxy']['http_proxy']
  template "/etc/apt/apt.conf.d/proxy" do
    source "aptproxy.erb"
    owner "root"
    group "root"
    mode 0600
  end
end

template "/usr/local/bin/gitproxy" do
  source "gitproxy.erb"
  owner "root"
  group "root"
  mode 0755
end

template "/etc/profile.d/proxy.sh" do
  source "systemproxy.erb"
  owner "root"
  group "root"
  mode 0755
end

package "socat"
