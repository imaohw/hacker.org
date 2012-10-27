#!/usr/bin/perl 

# Copyright (c) 2012, Sebastian Köhler<sebkoehler@whoami.org.uk>

use strict;
use warnings;

use GD;

my $image = GD::Image->newFromPng("Doll2.png",1);
my $buffer = "";

my ($width,$height) = $image->getBounds();

open FILE, ">Doll2.7z";
binmode(FILE);

for(my $y = 0; $y < $height; $y++) {
    for(my $x = 0; $x < $width; $x++) {
        my ($r, $g, $b) = $image->rgb($image->getPixel($x,$y));
        vec($buffer, 0, 8) = $r;
        print FILE $buffer;
    }
}

close FILE;
