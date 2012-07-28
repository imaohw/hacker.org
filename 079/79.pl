#!/usr/bin/perl


use warnings;
use strict;
use GD;


my $image = GD::Image->newFromPng('stars.php',1); 
my ($width, $height) = $image->getBounds();

for(my $i = 8; $i < ($height-1); $i+=16) {
    my $bin = "";
    for(my $j = 8; $j < 121; $j+=16) {
        my $index = $image->getPixel($j,$i);
        my ($r, $g, $b) = $image->rgb($index);

        #print("$r, $g, $b\n");

        if($b == 44) {
            $bin .= "0";
        } else {
           $bin .= "1";
        }
     }
     print(chr(bin2dec($bin)));
}

print "\n";

sub bin2dec { return unpack("N", pack("B32", substr("0" x 32 . shift, -32))); }
