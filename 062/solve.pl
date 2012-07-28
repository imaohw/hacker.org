#!/usr/bin/perl

# Test if 'power of two'

use strict;
use warnings;

foreach(0..4000) {
    if(($_ & ($_-1)) == 0) {
        print "$_\n";
    }
}
