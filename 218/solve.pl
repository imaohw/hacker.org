#!/usr/bin/perl 

# Copyright (c) 2012, Sebastian Köhler<sebkoehler@whoami.org.uk>

use strict;
use warnings;

use GD;

my $img_1 = GD::Image->new("masgo-1.gif") or die "error $!";
my $img_2 = GD::Image->new("masgo-2.gif") or die "error $!";

my ($width,$height) = $img_1->getBounds();

my $img_3 = GD::Image->new($width, $height);
my $w_3 = $img_3->colorAllocate(0,0,0);
my $b_3 = $img_3->colorAllocate(255,255,255);

for(my $y = 0; $y < $height; $y++) {
    for(my $x = 0; $x < $width; $x++) {
        my ($r_1,$g_1,$b_1) = $img_1->rgb($img_1->getPixel($x,$y));
        my ($r_2,$g_2,$b_2) = $img_2->rgb($img_2->getPixel($x,$y));

        if($r_1 & $r_2) {
            $img_3->setPixel($x,$y,$b_3);
        }
    }
}

open IMAGE, ">solve.png";
binmode IMAGE;
print IMAGE $img_3->png;
close IMAGE;
