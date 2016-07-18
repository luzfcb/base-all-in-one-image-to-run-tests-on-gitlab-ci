FROM ubuntu:16.04
# add support to 32bit packages
RUN dpkg --add-architecture i386

# Install Ansible
RUN apt-get update
RUN apt-get install -y software-properties-common python-dev build-essential wget --yes --quiet
RUN wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
RUN python2 /tmp/get-pip.py -U
RUN pip install ansible

# Install Ansible inventory file
RUN mkdir -p /etc/ansible/
RUN echo "[home]\nlocalhost ansible_connection=local" > /etc/ansible/hosts
RUN echo "[defaults]\nhostfile=./hosts" > /etc/ansible/ansible.cfg
