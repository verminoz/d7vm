D7VM
=============

## What is it?
**d7vm** is an attempt to create a [vagrantbox](https://www.vagrantup.com) that is tailored for the needs of [Drupal 7](http://www.drupal.org) development.

Contibutions are very welcome :-)

## Installation
The vagrantbox is mostly built with reference to a *Linux* host but should work fine under *Windows/Mac*.

1. Make sure you have installed VirtualBox (>= 4.3.10) and Vagrant (>= 1.7.2)
2. Clone the repository in the directory of your choice
3. `cd` to that directory and run `vagrant up`
4. Go get a cup of coffee but don't be too late. It doesn't take that long ;-)

Unless you have changed the Vagrantfile config the server will run on *192.168.33.30*. Configure your hosts file to be able to use an alias. For example add the following line to `/etc/hosts`:
`192.168.33.30 d7vm.dev`

The installation directory is set to /var/www --> /vagrant/www

## Technical specifications
By default the box will be set with the following specs:

### VM
+ 2 cores, CPU limit 100%
+ Memory 1536MB, Video Memory 16MB
+ Disk SSD mode
+ Ubuntu 12.04 LTS 64bit (*hashicorp/precise64* image)

### Server
+ Apache2
+ PHP 5.5
+ MySQL

### Tools
+ Drush 7.x
+ Composer

## Usage
By the time the vagrantbox is up and running you have a server that is configured and tailored according for Drupal 7. The document root is located under `/var/www` where you can place your Drupal installations.
