#!/bin/bash

# Start the first process
service apache2 start
  
# Start the second process
service mysql start

tail -f /dev/null

