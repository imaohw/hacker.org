#!/usr/bin/perl

use strict;
use warnings;

my $text = ",6u!tvtor, s! r3msuv 3HT";
my @tmp = reverse(split(//,$text));

my %sub_table = ( "3" => "e", "v" => "a", "u" => "n", 
                  "m" => "w", "!" => "i", "6" => "g",);

foreach(@tmp) {
    print $sub_table{$_} || $_;
}

print "\n";
