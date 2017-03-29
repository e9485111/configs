#!/bin/bash
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i my_hosts run_google.yml --ask-pass --ask-become-pass

