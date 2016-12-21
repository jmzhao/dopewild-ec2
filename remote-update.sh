#!/bin/bash

scp -F ssh_config -rp ec2-remote/. cfsgd-ec2:~
