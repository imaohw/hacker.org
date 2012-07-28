#!/usr/bin/perl

use strict;
use warnings;

my @cipher = split(//,"cqrb lryqna rb fjh, fjh qjamna cqjw axc cqracnnw. qnan, hxd wnena twxf qxf oja cx bqroc! xq kh cqn fjh, cqn jwbfna rb mnjmvjwblqnbc");

foreach my $i (0..26) {
    print "$i: ";
    foreach(@cipher) {
        my $ascii = ord($_);
        if($ascii == 32 || $ascii == 44 || $ascii == 46) {
            print $_;
            next;
        }
    
        $ascii += $i;
        if($ascii > 122) {
            $ascii = ($ascii - 122) + 96;
        }
    
        print chr($ascii);
    }
    print "\n";
}

