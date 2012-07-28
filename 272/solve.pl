#!/usr/bin/perl


use warnings;
use strict;
use GD;


my $image = GD::Image->newFromPng('blue.png',1); 

my ($width,$height) = $image->getBounds();

for(my $y = 0; $y < $height; $y++) {
    for(my $x = 0; $x < $width; $x++) {
        my $index = $image->getPixel($x,$y);
        my ($r, $g, $b) = $image->rgb($index);
        
#        print("$r, $g, $b\n");

        print(chr($b)); 
     }
     print("\n");
}

