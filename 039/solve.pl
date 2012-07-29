#!/usr/bin/perl

use strict;
use warnings;

require "../lib/math.pl";

my $bcd = "0111 0011 1001 0011 1001 0001";

foreach(split(' ',$bcd)) {
    print bin2dec($_);
}

print "\n";
