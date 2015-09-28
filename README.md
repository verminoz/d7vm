D7VM
=============

## What is it?
**d7vm** is an attempt to create a [vagrantbox](https://www.vagrantup.com) that is tailored for the needs of Drupal 7 development.

Contibutions are very welcome :-)

## Installation
The vagrantbox is mostly built with reference to a *Linux* host but should work fine under *Windows/Mac*.

1. Make sure you have installed VirtualBox (>= 4.3.10) and Vagrant (>= 1.7.2)
2. Clone the repository in the directory of your choice
3. `cd` to that directory and run `vagrant up`
4. Go get a cup of coffee but don't be too late. It doesn't take that long ;-)

Unless you have changed the Vagrantfile config the server will run on *192.168.33.30*. Configure your hosts file (*/etc/hosts*) to be able to use a more practical domain name. For example you can add the following line:
`192.168.33.30 d7vm.dev`

## Technical specifications

### VM
By default the box will be set on the following specs:
+ 2 cores, CPU limit 100%
+ memory 1536MB, VRAM 16
+ SSD mode on
+ Ubuntu 12.04 LTS (hashicorp/precise64)

### Server
+ Apache2
+ PHP 5.5
+ MySQL
+ Drush 7
