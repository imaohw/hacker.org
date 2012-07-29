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

sub fibonacci {
    my ($stop) = @_;
    
    my @fib = (0,1);
    my $x = 0;
    my $y = 1;

    for(3..$stop) {
        ($x, $y) = ($y, $x+$y);
        push(@fib,$y);
    }

    return \@fib;
}

sub largest_prime {
    my $n = shift;

    my $i;
    my $factor;
    
    if(abs($n)<=1) {
        return $n;
    }
    
    if($n % 2 == 0) {
        $factor = 2;

        while($n % $factor == 0) {
            $n /= $factor;
        }
    }
    
    if($n % 3 == 0) {
        $factor = 3;

        while($n % $factor == 0) {
            $n /= $factor;
        }
    }

    $factor = 5;
    while($n > $factor) {
        print "$factor\n";
        while($n % $factor == 0) {
            $n /= $factor;
        }
        $factor += 2;
        
        if($factor == $n) {
            last;
        }

        while($n % $factor == 0) {
            $n /= $factor;
        }
        $factor += 4;
    }   
    
    return $factor;
}
1;
