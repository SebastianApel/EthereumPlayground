Vagrant.configure("2") do |config|
  config.vm.box = "vagrant-ubuntu-trusty-64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    
  # Forward Ethereum Ports to the Vagrant Box
  config.vm.network :forwarded_port, host: 4000, guest: 4000
  config.vm.network :forwarded_port, host: 30303, guest: 30303
  config.vm.network :forwarded_port, host: 30303, guest: 30303, protocol: 'udp'

  config.vm.provider "virtualbox" do |v|
    #v.memory = 1024
    v.memory = 2000
    # v.cpus = 2

      file_to_disk = File.realpath( "." ).to_s + "/data/disk.vdi"
        
      if ARGV[0] == "up" && ! File.exist?(file_to_disk) 
               puts "Creating 5GB disk #{file_to_disk}."
               v.customize [
                    'createhd', 
                    '--filename', file_to_disk, 
                    '--format', 'VDI', 
                    '--size', 10000 * 1024 # 5 GB

                ]                 
               v.customize [
                    'storageattach', :id, 
                    '--storagectl', 'SATAController', 
                    '--port', 1, '--device', 0, 
                    '--type', 'hdd', '--medium', 
                    file_to_disk
                    ]
        end
  end
            
  # Add the new disk
  config.vm.provision "shell", path: "add_new_disk.sh"

  # Lay the ground
  config.vm.provision "shell", path: "provision.sh", privileged: false  
  
  # Install the docker container
  config.vm.provision "docker" do |d|
    d.build_image "/vagrant/eth-go"
  end
    
  
end

