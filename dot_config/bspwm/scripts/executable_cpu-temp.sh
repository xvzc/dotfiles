#!/bin/bash

if [[ "$(lscpu | grep 'Vendor ID:' | awk '{print $3}' | grep -q 'AMD')" -eq 0 ]]; then
  sensors | grep "Tctl:" | tr -d '+' | awk '{print $2}'
fi

if [[ "$(lscpu | grep 'Vendor ID:' | awk '{print $3}' | grep -q 'Intel')" -eq 0 ]]; then
  sensors | grep "Package id 0:" | tr -d '+' | awk '{print $4}'
fi
