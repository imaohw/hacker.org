#!/usr/bin/perl 

# Copyright (c) 2012, Sebastian Köhler<sebkoehler@whoami.org.uk>

use strict;
use warnings;

use Math::Prime::Util::GMP ':all';

open FILE, "<10000.txt";
my $pi = <FILE>;

my $length = 0;

for(my $i = 0; $i <= 2048; $i++) {
    for(my $j = 1; $j <= 2048 - $i; $j++) {
        my $number = substr($pi, $i, $j);
        if(length($number) < $length) {
            next;
        }
        
        if(is_prob_prime($number)) {
            if(length($number) >= $length) {
                $length = length($number);
                print(length($number) . " $number" . "\n");
            }
        }
    }
}

close FILE;
