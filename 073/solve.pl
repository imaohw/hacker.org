#!/usr/bin/perl

use strict;
use warnings;

my $cc = 1;

for(my $i = 1; $i <= 11589; $i++) {
    if((($cc ^ $i) % 4) == 0) {
        $cc += 1;
    }

    $cc += ($i % 7);
}

print "$cc\n";
