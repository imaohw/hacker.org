#!/usr/bin/perl

use strict;
use warnings;

sub dec2bin {
    my $str = unpack("B32", pack("N", shift));
    $str =~ s/^0+(?=\d)//;   # otherwise you'll get leading zeros
    return $str;
}

sub bin2dec {
    return unpack("N", pack("B32", substr("0" x 32 . shift, -32)));
}

sub div {
  my ($a, $b) = @_;
  return ($a - $a % $b) / $b ;
}

sub dec2base {
    my ($number, $base) = @_;
    my $result = "";

    while($number >= $base) {
        $result = $number % $base . $result;
        $number = div($number,$base);
    }

    return $number . $result;
}

1;
