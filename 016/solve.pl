#!/usr/bin/perl

use strict;
use warnings;


my $a = 73;
my $b = 391;
my @c = ('a', 'x', 'k', 'y', 'u', 'e');

my $s = "";

for(my $i = 0; $i < 6; $i++) {
    $s .= $c[($i * $b + ($i + 8) * $a) % @c];
}

print "$s\n";
