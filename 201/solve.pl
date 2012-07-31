#!/usr/bin/perl

my $t9 = { 1 => " ",
           2 => "ABC",
           3 => "DEF",
           4 => "GHI",
           5 => "JKL",
           6 => "MNO",
           7 => "PQRS",
           8 => "TUV",
           9 => "WXYZ"
         };


my $code = "8443312667777933777144477771444744666_66330";

my $count = 0;
my $prev = "";

my $cur = "";
my $msg = "";
foreach(split('',$code)) {
    if($_ eq "_") {
        $cur = (split('',$t9->{$_}))[$count];
        $count = 0;
    }
    if($_ ne $prev) {
        $msg .= $cur;
        $prev = $_;

        $count = 0;
        $cur = (split('',$t9->{$_}))[0];
    } else {
        if($count == length($t9->{$_}) - 1) {
            $cur = (split('',$t9->{$_}))[$count];
            $msg .= $cur;
            $count = 0;
        } else {
            $count++;
            $cur = (split('',$t9->{$_}))[$count];
        }
    }
}

print "$msg (IPHONE)\n";
