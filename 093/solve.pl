#!/usr/bin/perl

use strict;
use warnings;

my $seq = "";

open PI, "<pi.txt";
    my $tmp = "";
    my $number;
    while(read(PI,$number,1)) {
        if($number eq ".") {
            next;
        }
        
        if($number == 9) {
            if(length($tmp) > length($seq)) {
                $seq = $tmp;
            }
            $tmp = "";
        } else {
            $tmp .= $number;
        }
    }
close PI;

print "$seq\n";
