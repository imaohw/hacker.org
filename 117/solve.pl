# Script for golly

use strict;

my $maxpop = 0;
my $maxgen = 0;

for(my $i = 0; $i < 5000; $i++) {
    g_step();
    if(g_getpop > $maxpop) {
        $maxgen = g_getgen();
        $maxpop = g_getpop();
    }
    g_show("MaxGen: $maxgen MaxPop: $maxpop");
}
