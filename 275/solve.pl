#!/usr/bin/perl

use strict;
use warnings;

my $text = "tulgqBmqBvuqbdhpslBtuclBmpBjpBfuzclstBjgsCBuztBxhtjBmpBvpfgzepBjpBbpctBdpgccqBehfk.BhBxpstBtuBjheBjuzepBgsqxgqBtuBezdodhepBjhmBxhtjBjumpmglpBeuzo.BhBxgckBhsBtuBjheBduumBuscqBtuBbhslBjhmBjuukhsCBzoBxhtjBmqBehetpd.BejpBfgstBldhap.BuzdBmumBlduapBjpdBtjpdp.Bbmc";

$text =~ s/B/ /g;
$text =~ tr/abcdefghijklmnopqrstuvwxyz/abcdefghijklmnopqrstuvwxyz/;

print "$text\n";
