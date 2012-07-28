#!/usr/bin/perl

use warnings;
use strict;

# fucking slow

calc(99);

sub calc {
    
    my ($num) = @_;
    my $num2 = 0;

    for(my $i = 0; $i < $num; $i++) {
        for(my $j = 0; $j < $num; $j++) {
            for (my $k = 0; $k < $num; $k++) {          
                for(my $l = 0; $l < $num; $l++) {
                    $num2 =  unpack "l", pack "l", $num2 + length($i . " to " . $j . " to " . $k . " to " . $l) * $num;
                    $num2 = unpack "l", pack "l", $num2 + 4 * $num;
                    if($num < 10) {
                        $num2 = unpack "l", pack "l", $num2 + $num;
                    } else {
                        $num2 = unpack "l", pack "l", $num2 + 10 + (2 * ($num-10));
                    }
                }
            }
        }
        print("$i\n");
    }
    print "val: $num2\n";
}

