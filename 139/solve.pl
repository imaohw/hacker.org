#!/usr/bin/perl

use strict;
use warnings;

open(FILE,"text.txt") or die($!);
    my $text = do { local $/; <FILE>};
close(FILE);

my @uc = $text =~ /[A-Z]/g;

print @uc;
print "\n";
