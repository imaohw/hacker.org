#!/usr/bin/perl

use strict;
use warnings;

open(FILE_1,"gettysburg_hacker.txt") or die($!);
open(FILE_2,"gettysburg_org.txt") or die($!);

my $file_1 = do { local $/; <FILE_1> };
my $file_2 = do { local $/; <FILE_2> };

close(FILE_1);
close(FILE_2);

$file_1 =~ s/,|\.//g;
$file_2 =~ s/,|\.//g;

my @file_1 = split(' ',$file_1);
my @file_2 = split(' ',$file_2);

my $j = 0;
for(my $i = 0;$i < @file_1;$i++) {
    if($file_1[$i] ne $file_2[$j]) {
        print(" $file_1[$i]");
    } else {
        $j++;
    }
}

print "\n";
