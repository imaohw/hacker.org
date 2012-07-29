#!/usr/bin/perl

use strict;
use warnings;

require "../lib/math.pl";

my @fib = @{fibonacci(18)};

my $sum = 0;
for(my $i = 10; $i < 18; $i++) {
    $sum += $fib[$i];
}

print "$sum\n";
