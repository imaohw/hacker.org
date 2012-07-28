#!/usr/bin/perl

use warnings;
use strict;

use GD;

my $image = GD::Image->newFromPng('greenline.png', 1);
my ($width, $height) = $image->getBounds();

for(my $i = 0; $i < $width; $i++) {
    my $index = $image->getPixel($i,0);
    my ($r,$g,$b) = $image->rgb($index);
    print(chr($g));
}

print("\n");
