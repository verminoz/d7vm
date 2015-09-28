###########################################
### nparasta's vagrantbox configuration ###
###########################################

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Set all configurable variables here for easy modification
host_name = ENV['BIFROST_GUEST_NAME']   || 'npdev'
host_ip   = ENV['BIFROST_GUEST_IP']     || '192.168.33.30'
memory    = ENV['BIFROST_GUEST_MEMORY'] || '1536'
cores     = ENV['BIFROST_GUEST_CORES']  || '2'
cpu_limit = ENV['BIFROST_GUEST_CLIMIT'] || '100'
vram_size = ENV['BIFROST_GUEST_VRAM']   || '16'
disk_ssd  = ENV['BIFROST_HOST_SSD']     || 'on'
php_version = ENV['BIFROST_GUEST_PHP_VERSION']   || '5.6'
vagrant_box = ENV['BIFROST_GUEST_BOX'] || 'hashicorp/precise64'
shared_folder = ENV['BIFROST_HOST_SHARE'] || '.'
local_mount_point           = "/vagrant"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Set box
  config.vm.box = vagrant_box
  
  ## Enable SSH agent forwarding. Could also utilize SSH key copying.
  # config.ssh.forward_agent = true
  
  # Provisioning scripts.
  config.vm.provision :shell, path: "provision/bootstrap.sh"
  
  # Port forwarding.
  #config.vm.network :forwarded_port, guest: 80, host: 80
  
  # Set box configuration specifics.
  config.vm.define "default", primary: true do |box|
    box.vm.post_up_message = "                                                         
         88  888888888888                                
         88          ,8P'                                
         88         d8\"                                  
 ,adPPYb,88       ,8P'  8b       d8  88,dPYba,,adPYba,   
a8\"    `Y88      d8\"    `8b     d8'  88P'   \"88\"    \"8a  
8b       88    ,8P'      `8b   d8'   88      88      88  
\"8a,   ,d88   d8\"         `8b,d8'    88      88      88  
 `\"8bbdP\"Y8  8P'            \"8\"      88      88      88  
                                                         
                                                         
"

    # Set hostname
    box.vm.hostname = "vagrantbox"

    # Set box technical parameters
    box.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", memory]
      vb.customize ["modifyvm", :id, "--cpus", cores]
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", cpu_limit]
      vb.customize ["modifyvm", :id, "--vram", vram_size]

      ## Set the machine name in the VirtualBox GUI
      vb.name = host_name
      vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', '0', '--device', '0', '--nonrotational', disk_ssd]
    end

    box.vm.network :private_network, ip: host_ip

    # Per Vagrant 1.7.x and onwards we need to do this ourselves.
    box.vm.synced_folder shared_folder, "/vagrant"

    ## Enable NFS export on *nix systems only.
    if Vagrant::Util::Platform.windows?
      box.vm.synced_folder shared_folder, local_mount_point, type: "rsync", rsync__exclude: ".git/"
    else
      box.vm.synced_folder shared_folder, local_mount_point, :nfs => true, id: "vagrant-root"
    end
  end
end
