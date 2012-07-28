#!/bin/bash

curl -I http://www.hacker.org/challenge/misc/one.php 2>/dev/null | grep answer
