#!/usr/bin/perl 

# Copyright (c) 2012, Sebastian Köhler<sebkoehler@whoami.org.uk>

use strict;
use warnings;
use File::Next;

my $iter = File::Next::files( { sort_files => 1 }, './manyfiles' );
my $buffer = "";

open IMAGE, ">image.png";
binmode(IMAGE);

while ( defined ( my $file = $iter->() ) ) {
    vec($buffer, 0, 8) = -s "$file";
    print IMAGE $buffer;
}

close IMAGE;
