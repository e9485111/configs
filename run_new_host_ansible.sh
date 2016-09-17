#!/bin/bash
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i my_host run.yml --ask-pass --ask-become-pass

