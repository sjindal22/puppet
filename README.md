# puppet

## Introduction

* Puppet is a declrative language, as in, you define the state of a machine
beforehand.
* Puppet comprises resource types (files, package, user, group, service).
* Each resource type has providers (for eg, package has yum, apt, etc) that helps
achieve the state as defined by user in the code.

## Commands

* `/opt/puppetlabs/` - location where all puppet related files are installed. This
should be in the path before working with puppet.
* `yum install puppetserver` - installs server
* `yum install puppet agent` - installs agent
* `puppet resource [resource_type] [name of the resource]` - puppet interacts 
with RAL (RESOURCE ABSTRACTION LAYER) and gets the current state of the resource
* `puppet resource user xyz ensure=present` - creates a user if non-existent
* `puppet describe --list` - shows all the resources available.
* `puppet describe user | more` - shows attributes related to resource tupe users
* `puppet config print modulepath`

## Class structure

* For each environment, puppet looks for class definition in the `/etc/puppetlabs/code/environments/production/modules` path, in a file named init.pp..
* Define your class/module name under `modules`, followed by a `manifests` sub-
directory and finally the init.pp underneath.
``` 
* [root@puppet modules]# pwd
/etc/puppetlabs/code/environments/production/modules
[root@puppet modules]# tree sysadmin
sysadmin
└── manifests
    └── init.pp
```
* 

## Puppet Agent & Server

* Puppet server is installed via `yum install puppetserver`, followed by starting
it using `systemctl start puppetserver`.
* On the puppet agent host, add IP addr of the server to `/etc/hosts` file and 
then run `yum install puppet agent`, followed by `puppet agent -t` command.
* This will have the agent generate a CSR to the server for SSL authenication.
* Server will receive this request and will need to sign it. You can check this
by executing `puppet cert --list`. For approving, run `puppet cert --sign <name
of the cert>`.
* `puppet cert --list --all` - to list all signed/unsigned certs.
* `puppet cert --print puppet.localdomain` - to show details about the cert.

