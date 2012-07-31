#!/usr/bin/perl

use strict;
use warnings;

open PI, "pi.txt";
    my $pi = do { local $/;<PI> };
close PI;

$pi =~ s/\.//;

my $pattern = "3";
for(my $i = 0; $i < 1000000; $i++) {
    
    print("\r" . (($i / 1000000) * 100) . "%");

    for(;;) {
        my $tmp = substr($pi,$i,length($pattern) + 1);
        my @matches = $pi =~ /$tmp/g;

        if(@matches > 1) {
            $pattern = $tmp;
            print "\n$pattern\n";
        } else {
            last;
        }
    }    
}

print "\n$pattern\n";
