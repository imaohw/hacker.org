#!/usr/bin/perl

use strict;
use warnings;
use GD;

my %images = ();
my %number = ();

opendir(DIR,'captchas');
my @files = readdir(DIR);
closedir(DIR);

print "loading files\n";
my $count = 0;
foreach(@files) {
    if($_ eq "." or $_ eq "..") {
        next;
    }
    my $image = GD::Image->newFromPng("captchas/$_", 1) or die $!;

    my ($width,$height) = $image->getBounds();

    my ($index, $r, $g, $b);
    my $white = 0;
    for(my $x = 1; $x <= $width; $x++) {
        for(my $y = 1; $y <= $height; $y++) {
            $index = $image->getPixel($x,$y);
            ($r,$g,$b) = $image->rgb($index);
        
            if($r != 0 or $g != 0 or $b != 0) {
                $white++;
            }
        }
    }
    $images{$white} .= "captchas/$_ ";
    
    if(defined($number{$white})) {
        $number{$white}++;
    } else {
        $number{$white} = 1;
    }
    $count++;

    if(($count % 500) == 0) {
        print("$count\n");
    }
}

$count = 0;
my $size = keys(%images);
foreach(keys(%images)) {
    print("$count/$size\n");
    if($number{$_} > 1) {
        `feh -i $images{$_}`;
    }
    $count++;
}


