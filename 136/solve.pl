#!/usr/bin/perl

use strict;
use warnings;

require "../lib/math.pl";

my $msg = "abbbabaaabbabaaaabbaababaabaaaaaabbaaaababbabb".
          "baabbbaabbabbbabbbabbaabababbbaabaaabaaaaaabba".
          "baababbbaabbaabaaaaaabbaaaababbaabaaabbbababab".
          "babbababbaaabaabbbaabaabbaaaababbbabaaabbaabab";


my $bin_char = "";
foreach(split("",$msg)) {
    if(length($bin_char) == 8) {
        print(chr(bin2dec($bin_char)));
        $bin_char = "";
    }

    $bin_char .= $_ eq 'b' ? "1" : "0";
}

print "\n";
