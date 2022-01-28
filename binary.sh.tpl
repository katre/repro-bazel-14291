#!/bin/bash
(
  echo "cpu: %cpu%"
  echo "apple.single_arch_cpu: %single_arch_cpu%"
  echo "platform: %platform%"
  echo "host platform: %host_platform%"
) > "$1"

