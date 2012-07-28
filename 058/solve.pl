#!/usr/bin/perl

use strict;
use warnings;

open FILE, "<lorem.txt";
my $text = do { local $/; <FILE> };
close FILE;

$text =~ s/,|\.//g;
$text =~ s/\r\n/ /g;

my %word_count = ();

foreach(split(/ /,$text)) {
    $word_count{$_}++;
}

foreach(keys(%word_count)) {
    if($word_count{$_} == 1) {
        print "$_\n";
    }
}
