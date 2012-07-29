#!/usr/bin/perl

use strict;
use warnings;
use GD;

my $image = GD::Image->newFromPng("listen.png",1) or die($!);

my ($width,$height) = $image->getBounds();

open OUT, ">solve.mp3";
binmode(OUT);
    foreach my $y(0..$height-1) {
        foreach my $x(0..$width-1) {
            my $buffer ='';
            my @rgb = $image->rgb($image->getPixel($x,$y));
            
            foreach(@rgb) {
                vec($buffer,0,8) = $_;
                print OUT $buffer;
            }
        }
    }
close OUT;

