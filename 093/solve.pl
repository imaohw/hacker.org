#!/usr/bin/perl

use strict;
use warnings;

use IO::Uncompress::Gunzip qw(gunzip);

my $seq = "";
my $pi;

gunzip("pi.txt.gz" => \$pi);

my $tmp = "";
foreach(split('',$pi)) {
    if($_ eq ".") {
        next;
    }
        
    if($_ == 9) {
        if(length($tmp) > length($seq)) {
            $seq = $tmp;
        }
        $tmp = "";
    } else {
        $tmp .= $_;
    }
}

print "$seq\n";
