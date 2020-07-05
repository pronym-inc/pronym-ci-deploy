export VAGRANT_GIT_EMAIL=$(shell git config --get user.email)
export VAGRANT_GIT_NAME=$(shell git config --get user.name)

spinup:
	echo "192.168.70.1  pronymcivagrant.local" | sudo tee -a /etc/hosts
	cp ~/.ssh/id_rsa git_ssh_key
	vagrant up
	sleep 5s
	open -a "Google Chrome" http://pronymcivagrant.local