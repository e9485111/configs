#!/bin/bash
mysql -uvm_bi_prod_rw -pb4tst3r -Dvendor_marketing_bi_production -hshared-db -e "$1"
