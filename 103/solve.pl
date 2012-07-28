#!/usr/bin/perl

use strict;
use warnings;

require "../lib/math.pl";

use GD;

my $image = GD::Image->newFromPng("didactrgb.png",1);

my @rgb = $image->rgb($image->getPixel(0,0));
my $bin = "";

foreach(@rgb) {    
    my $tmp = dec2bin($_);
    while(length($tmp) < 8) {
        $tmp = "0" . $tmp;
    }

    $bin .= $tmp;
}

print bin2dec($bin) . "\n";
