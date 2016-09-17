#!/bin/bash
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts copy_config.yml --ask-pass --ask-become-pass
