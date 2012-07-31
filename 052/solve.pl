#!/usr/bin/perl

use strict;
use warnings;

use GD;

my @direction = ( 'ro', 'ro', 'lu', 'dk', 'dk', 'ro', 'ro', 'ua', 'ua', 'dk', 'ro', 'dk', 'ro', 'ro', 'ua',
                  'lu', 'dk', 'dk', 'ro', 'ro', 'ro', 'ua', 'ua', 'ua', 'ro', 'ro', 'dk', 'lu', 'lu', 'ro',
                  'ro', 'dk', 'dk', 'ro', 'ua', 'ua', 'ua', 'ro', 'dk', 'ro', 'dk', 'ro', 'dk', 'ro', 'ua',
                  'ua', 'ua', 'dk', 'dk', 'dk', 'ro', 'ro', 'ro', 'ua', 'lu', 'lu', 'ua', 'ua', 'ro', 'ro',
                  'ro', 'dk', 'ro', 'dk', 'ro', 'dk', 'ro', 'ua', 'ro', 'ua', 'ro', 'ua', 'ro', 'dk', 'ro',
                  'dk', 'ro', 'dk', 'ro', 'ua', 'ro', 'ua', 'ro', 'ua', 'ro', 'ro', 'ro', 'lu', 'lu', 'dk',
                  'dk', 'ro', 'lu', 'dk', 'ro', 'ro', 'ro', 'ua', 'ua', 'ua', 'ro', 'ro', 'dk', 'dk', 'lu',
                  'lu', 'ro', 'dk', 'ro', 'ro', 'ro', 'ro', 'ua', 'ua', 'dk', 'dk', 'ro', 'ro', 'ua', 'lu',
                  'ua', 'ro', 'lu', 'dk', 'ro', 'dk', 'ro', 'ro', 'ro', 'ua', 'ua', 'ua', 'ro', 'ro', 'lu',
                  'lu', 'dk', 'dk', 'ro', 'lu', 'dk', 'ro', 'ro', 'ro', 'ro', 'ua', 'ua', 'ua', 'lu', 'ro',
                  'ro', 'lu', 'dk', 'dk', 'dk', 'ro', 'ro', 'ro', 'ua', 'ua', 'ua', 'ro', 'ro', 'lu', 'lu',
                  'dk', 'dk', 'dk', 'ro', 'ro', 'ro', 'ua', 'ua', 'ua', 'dk', 'ro', 'ro', 'ua', 'dk', 'dk',
                  'dk', 'ro');

my $img = new GD::Image(1000,150);
my $x = 50;
my $y = 50;
my $size = 15;

my $black = $img->colorAllocate(0,0,0);
my $white = $img->colorAllocate(255,255,255);

foreach(@direction) {
    my ($new_x, $new_y) = ($x,$y);
    if($_ eq 'ro') {
        $new_x = $x + $size;
    }
    if($_ eq 'lu') {
        $new_x = $x - $size;
    }
    if($_ eq 'dk') {
        $new_y = $y + 10;
    }
    if($_ eq 'ua') {
        $new_y = $y - 10;
    }
    
    $img->line($x,$y,$new_x,$new_y,$white);
    $x = $new_x;
    $y = $new_y;
}

open (FILE,">telecran.png") || die($!);
binmode FILE;
print FILE $img->png;
close FILE;
