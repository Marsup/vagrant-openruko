apt_repository "heroku-toolbelt" do
  uri "http://toolbelt.heroku.com/ubuntu"
  components ["./"]
end

script "setup-heroku-toolbelt" do
  interpreter "bash"
  user  "root"
  code <<-EOF
  wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add -
  EOF
end

package "heroku-toolbelt"