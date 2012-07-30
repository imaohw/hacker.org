#!/usr/bin/perl

use strict;
use warnings;

my @bytes = (0x31,0xcf,0x55,0xaa,0x0c,0x91,0xfb,0x6f,0xcb,0x33,0xf3,0x47,0x93,
             0xfe,0x00,0xc7,0x2e,0xbc,0x4c,0x88,0xfd,0x57,0xdc,0x6b,0xa7,0x1e,
             0x71,0xb7,0x59,0xd8,0x35,0x88);


foreach my $b(0..255) {
    X_LOOP: 
    foreach my $x(0..255) {
        my $tmp_b = $b;
        my $msg = "";
        foreach(@bytes) {
            my $byte = $tmp_b ^ $_;
            if($byte < 32 || $byte > 126) {
                next X_LOOP;
            } else {
                $msg .= chr($byte);
            }
            $tmp_b = ($tmp_b + $x) % 256;
        }
        print("$msg\n");
    }
}
