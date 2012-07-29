#!usr/bin/perl

use strict;
use warnings;

require "../lib/math.pl";

my $total = 0;

foreach(0..2118) {
    if(is_perfect_square($_)) {
        $total += 2 * $_;
    } else {
        $total += $_;
    }
}

print "$total\n";
