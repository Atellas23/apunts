#!/bin/bash
grep -i -e "physical id" -e "core id" -e "apicid  " -e processor -e "^$" /proc/cpuinfo
