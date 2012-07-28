#!/usr/bin/perl

use strict;
use warnings;

open FILE, "<rfc3280.txt" or die $!;
my $content = do { local $/;  <FILE> };
close FILE;


$content =~ s/\n/ /g;
$content =~ s/\s{2,}/ /g;

foreach my $word (split(" ",$content)) {
    if(length($word) == 9) {
        print "$word ";
    }
}
