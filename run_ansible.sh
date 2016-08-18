#!/bin/bash
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts run.yml --ask-pass --ask-become-pass
