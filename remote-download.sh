#!/bin/bash

scp -F ssh_config -rp cfsgd-ec2:~/$1 $1
