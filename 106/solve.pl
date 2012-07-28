#!/usr/bin/perl

use strict;
use warnings;

require "../lib/math.pl";

my @numbers = (199, 77, 202);
my $integer = "";

foreach(@numbers) {
    my $bin = dec2bin($_);
    while(length($bin) < 8) {
        $bin = "0" . $bin;
    }
    $integer .= $bin;
}

print bin2dec($integer) . "\n";

