# Vagrant OpenRuko

This is the easiest way to test [OpenRuko](https://github.com/openruko).

## Install

Vagrant OpenRuko will generate a new VirtualBox VM with OpenRuko and all its dependencies already installed.

```
$ sudo apt-get install vagrant
$ git clone https://github.com/Marsup/vagrant-openruko.git
$ cd vagrant-openruko
$ vagrant up
# wait ...
```

## Launch tests

The first usage of `Vagrant OpenRuko` was for testing openruko on a clean VM.

To launch the test run:

```
$ ssh vagtrant@localhost -p 2222
[vagrant] $ cd ~/openruko/keepgreen
[vagrant] $ ./run.sh
```

See also [keepgreen](https://github.com/Filirom1/orKeepGreen)

## Standalone usage

Before starting the VM export some environment variables, in the host machine:

```
export S3_KEY=YOUR_S3_KEY
export S3_SECRET=YOUR_S3_SECRET
export S3_BUCKET=YOUR_S3_BUCKET
```

If you are under a proxy, export the following environment variable in the host machine:

```
export HTTP_PROXY=http://proxy.xxx:3128
export HTTPS_PROXY=http://proxy.xxx:3128
export NO_PROXY=localhost
```

Connect to the Vagrant VM with SSH, and create a new project (we will use node.js)

```
$ ssh vagtrant@localhost -p 2222
[vagrant] $ mkdir myapp
[vagrant] $ cd myapp
[vagrant] $ git init
[vagrant] $ npm init
[vagrant] $ cat > index.js << EOF
var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
}).listen(1337, '127.0.0.1');
console.log('Server running at http://127.0.0.1:1337/');
EOF

[vagrant] $ cat > Procfile << EOF
web: node index.js
EOF

[vagrant] $ git add -A
[vagrant] $ git commit -m 'fisrt commit'

[vagrant] $ ~/openruko/client/openruko create myapp
# email: openruko@openruko.com
# Password: vagrant

[vagrant] $ git push heroku master
[vagrant] $ curl 127.0.0.1:1337
```



