#!/usr/bin/perl

use strict;
use warnings;

my $grammar = { A => 'is', B => 'mm', C => 'oo', D => 'rgr', E => 'ryg',
                F => 'dth', G => 'you', H => 'esol', I => 'ionA',
                J => 'GDaBarA', K => 'veECFHutI', L => 'PQ', M => 'n',
                N => 'm', O => 'oaNcho', P => 'MO', Q => 'NR', R => 'sky',
                S => 'JKL'
              };

my $string = 'S';
while($string =~ /([A-Z])/) {
    my $tmp = $grammar->{$1};
    $string =~ s/$1/$tmp/;
}

print "$string\n";
