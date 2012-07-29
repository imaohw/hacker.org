#!/usr/bin/perl

use strict;
use warnings;

use bignum;

my $born = 1;
my $div_1 = 0;
my $div_2 = 0;
my $rdy = 0;

my $day = 1;

while(1) {
    $rdy = $div_2;
    $div_2 = $div_1;  
    $div_1 = $born;
    $born += $div_2;
    
    $day++;
    my $population = ($born + $div_1 + $div_2 + $rdy);

    if($population >= 1000000000000) {
        print "$day\n";
        last;
    }
}

