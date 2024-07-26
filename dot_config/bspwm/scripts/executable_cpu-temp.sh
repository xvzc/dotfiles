#!/bin/bash

if [[ "$(lscpu | grep 'Vendor ID:' | awk '{print $3}' | grep -q 'AMD')" -eq 0 ]]; then
  sensors | grep "Tctl:" | tr -d '+' | awk '{print $2}'
fi
