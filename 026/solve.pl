#!/usr/bin/perl

use strict;
use warnings;

my $x = 2;
my $y = 5;
my $z = 3;

my @a = (6, 5, 4, 9, 3, 7);

my $v = $y * $a[$y] + $z * $a[$z] - $y * $x * $z + $a[$y] * $a[$x] * $a[3];
$v = $v + $a[$z] + $a[$y] + 11 * $a[1] + $a[0] - 1;

print "$v\n"
;
