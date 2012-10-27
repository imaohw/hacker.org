#!/usr/bin/perl 

# Copyright (c) 2012, Sebastian Köhler<sebkoehler@whoami.org.uk>

use strict;
use warnings;

my $crypt = "fmpmfpmpp mmmpppfmmfppmpppff fmpppf pmfmffmpfmpp fmpmfpmpp fmfpppmfffpmmpppfffmmmpp mmmpppmpm mppfpmmpppffffmfmpmfpmffpppmfm mfffmm mpfppfpfffmpffmfmpfppppf";


my @tokens = split(" ",$crypt);

foreach(@tokens) {
    for(my $i = 0; $i < length($_); $i+=3) {
        my $letter = substr($_,$i,3);
        
        $letter =~ s/fmp/t/;
        $letter =~ s/mfp/h/;
        $letter =~ s/mpp/e/;

        $letter =~ s/mmm/a/;
        $letter =~ s/ppp/n/;
        $letter =~ s/fmm/s/;
        $letter =~ s/fpp/w/;
        $letter =~ s/pff/r/;

        $letter =~ s/fmf/u/;
        $letter =~ s/mff/i/;
        $letter =~ s/fpm/v/;

        $letter =~ s/ffm/y/;
        $letter =~ s/mfm/g/;

        $letter =~ s/mpm/d/;

        $letter =~ s/mpf/f/;
        $letter =~ s/ppf/o/;

        $letter =~ s/pmf/l/;

        print("$letter");
    }

    print(" ");
}

print("\n");
