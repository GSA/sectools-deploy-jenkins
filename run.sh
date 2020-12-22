rm -rf roles
ansible-galaxy install -p roles/external -r requirements.yml
ansible-playbook -vvv playbook.yml
