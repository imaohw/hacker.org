#!/usr/bin/perl

use strict;
use warnings;

# k = {unknown 4-byte value}
# for (i = 0; i < len(txt); i += 4)
#   c = (txt[i] -> txt[i + 3]) ^ k
#   print c
#   k = c

my @bytes = (0xe5534ada,0xc53023aa,0xad55518a,0xc42671f8,0xa1471d94,0xd8676ce1,0xb11309c1,
             0xc27a64b1,0xae1f4a91,0xc73f2bfc,0xe74c5e8e,0x826c27e1,0xf74c4f80,0x81296ff3,
             0xee451996,0x8a6570e2,0xaa0709c2,0xc4687eec,0xe44a1589,0x903e79ec,0xe75117ce,
             0xc73864ee,0xbe57119c,0x9e367fef,0xe9530dc1);

my @msg = ();
for(my $i = (@bytes -1); $i > 0; $i--) {
    push(@msg,$bytes[$i] ^ $bytes[$i-1]);
}

foreach(reverse(@msg)) {
    my $tmp_hex = sprintf("%x ",$_);
    my @tmp_bytes = ( $tmp_hex =~ m/.{2}/g );
    foreach my $byte(@tmp_bytes) {
        print(chr(hex($byte)));
    }
}

print "\n";
