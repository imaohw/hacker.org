#!/bin/bash

perl extract.pl
7z e -y Doll2.7z &> /dev/null
perl Doll2.pl > Doll2.py
python2 Doll2.py > Doll2.c
gcc -std=c99 -o Doll2 Doll2.c
./Doll2 > Doll2.hvm
python2 ../hvm/hackvm.py Doll2.hvm
rm Doll2 Doll2.7z Doll2.c Doll2.hvm Doll2.pl Doll2.py
