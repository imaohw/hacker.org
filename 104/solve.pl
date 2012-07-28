#!/usr/bin/perl

use strict;
use warnings;

use GD;

my $image = GD::Image->newFromPng("redline.png",1);

foreach(0..3) {
    my ($r,$g,$b) = $image->rgb($image->getPixel($_,0));
    printf("%02x",$r); 
}

print "\n";
