


ansible-playbook -i inventory play.yml  -e 'ansible_ssh_private_key_file=praveen.pem' -e  'host_key_checking=False'
