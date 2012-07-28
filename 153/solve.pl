#!/usr/bin/perl

use strict;
use warnings;

my@msg = split(//,"93752xxx746x27x1754xx90x93xxxxx238x44x75xx08750912738x8461".
                  "x8759383xx328x4x4935903x6x5550360535004x0xx945958961296x26".
                  "7x8842xxx5x6xx61x4x48482x80xxx83316843x7x4x83x9521731xxx25".
                  "x51xx457x6x5x9698222x771237745034x5133592x27xx8x87xx35221x".
                  "36x0x50x23x7x63x998418xx");

my $sum = 0;
for(my $i = 0; $i < @msg; $i++) {
    if($msg[$i] eq "x") {
        splice(@msg,$i,1);
        $i -= 3;
    } else {
        $sum += $msg[$i];
    }
}

print "$sum\n";
