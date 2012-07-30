#!/usr/bin/perl

use strict;
use warnings;

require "../lib/math.pl";

open(FILE,"text.txt") or die($!);
my @lines = <FILE>;
close(FILE);

my $count = 0;
my $bin = "";
foreach(@lines) {
    if($_ =~ /  /) {
        $bin .= "1";
    } else {
        $bin .= "0";
    }
    
    $count++;
    if($count >= 8) {
        $count = 0;
        print(chr(bin2dec($bin)));
        $bin = "";
    }
}

print "\n";
