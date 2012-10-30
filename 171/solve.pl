#!/usr/bin/perl 

# Copyright (c) 2012, Sebastian Köhler<sebkoehler@whoami.org.uk>

use strict;
use warnings;

my @crypt = ("5a", "63", "08", "47", "16", "08", "07", "35", "10", "4b", "6e",
             "0a", "59", "13", "44", "10");
my %elements = (90 => "th", 99 => "es", 8 => "o", 71 => "lu", 22 => "ti",
                7 => "n", 53 => "i", 16 => "s", 75 => "re", 110 => "ds",
                10 => "ne", 89 => "ac", 19 => "k", 68 => "er");

foreach(@crypt) {
    print($elements{hex($_)} || hex($_));
}
print("\n");
