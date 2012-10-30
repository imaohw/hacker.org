#!/usr/bin/perl 

# Copyright (c) 2012, Sebastian Köhler<sebkoehler@whoami.org.uk>

use strict;
use warnings;

use bignum;

my $phi = (1 + sqrt(5)) / 2;
my $beta = -1/$phi;

printf("%.3f\n", 150000000 * log($phi) - log($phi-$beta));
