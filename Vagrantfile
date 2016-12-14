Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  # Docker engine port
  config.vm.network "forwarded_port", guest: 2375, host: 2375, host_ip: "127.0.0.1"

  # Flask application
  config.vm.network "forwarded_port", guest: 5000, host: 5000

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "docker.yml"
  end

  config.vm.provision "shell", inline: <<-SHELL
    export DOCKER_HOST=tcp://localhost:2375
    cd /vagrant
    docker-compose build && docker-compose up
SHELL
end
