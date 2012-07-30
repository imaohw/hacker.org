#!/usr/bin/perl

use strict;
use warnings;

open(FILE,"text.txt") or die($!);
    my $text = do { local $/; <FILE>};
close(FILE);

my $cipher = join('',($text =~ /[A-Z]/g));
$cipher =~ tr/ABCDEFGHIJKLMNOPQRSTUVWXYZ/AHWREFEHSJKVMNOPIASTUVNTYZ/;

print "$cipher\n";
