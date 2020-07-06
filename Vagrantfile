# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.synced_folder "src", "/webapps/pronym_ci/src"
    config.vm.define "main" do |all_in_one|
        all_in_one.vm.box = "ubuntu/bionic64"
        all_in_one.vm.network "private_network", ip: "192.168.70.2"
        all_in_one.vm.provider "virtualbox" do |v|
            v.memory = 2048
        end
        all_in_one.vm.provision :ansible_local do |ansible|
            ansible.groups = {
                "all_in_one" => ["main"]
            }
            ansible.playbook = "playbook.yml"
            ansible.tags = "initial"
            ansible.extra_vars = {
                username: "vagrant",
                pronym_environment: "vagrant",
                server_name: "pronymcivagrant.local",
                is_vagrant: true,
                django_app_git_branch: "master",
                nginx_copy_ssl_certs: false,
                nginx_include_ssl_certs: false,
                nginx_listen_port: 80,
                supervisor_runserver_enabled: true,
                supervisor_gunicorn_enabled: false
            }
        end
    end
end