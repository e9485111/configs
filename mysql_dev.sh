#!/bin/bash
mysql -uvm_bi_dev_rw -pKi3hl -Dvendor_marketing_bi_development -hshared-db -e "$1"
