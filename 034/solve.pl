#!/usr/bin/perl

use strict;
use warnings;

use bignum;

my @value = split(//,(17 ** 39) ** 11);

my $count = 0;
while($count <= @value) {
    print $value[$count];
    $count += 33;
}

print "\n";

