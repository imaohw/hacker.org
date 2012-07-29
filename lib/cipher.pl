#!/usr/bin/perl

use strict;
use warnings;

sub rot_x {
    my ($cipher,$x) = @_;
    
    my $text = "";

    foreach(split('',$cipher)) {
        my $ascii = ord($_);
        
        if($ascii < 65 || ($ascii > 90 && $ascii < 97) || $ascii > 122) {
            $text .= $_;
            next;
        }

        my $i = 64;
        if($ascii > 96) {
            $i = 96;
        }

        $text .= chr(((($ascii - $i) + $x) % 26) + $i);
    }
    
    return $text;
}

1;
