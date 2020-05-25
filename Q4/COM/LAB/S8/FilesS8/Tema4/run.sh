#!/bin/bash

taskset -c 2 ./entrada-al-sistema <input &

taskset -c 2 ./entrada-al-sistema <input &

wait
