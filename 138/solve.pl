#!/usr/bin/perl

use strict;
use warnings;

my $s = "mQmPtphqGrboHhmgaqVhCdwTwignlQvjIopDqVpgaNrwkAzVcnkHyNiPdSmgJmgrPiMj".
        "pnjdbuPucHnouwfKuPcybromnmbvfxJqRnnOvWsceZeYzRyqnkaaFsffjenxoIhqHnIz".
        "orlOdwZoxYmAuNwNnRppguwidvbtOqdbUngpZdbGqwYjfpLzPjRtwVwEqBbYmCqbKwuz".
        "iCoEwPsIkJgruTbhdyWpvPztAodufjZxLaZcUeFaklSmeRfolohVbXoDfIqMqgIrQhze".
        "dqZlFwaBndQkQexBdLsCfXebrEfiOnSgYquyaqohxoDmLdDhwoOpgtkuRzeYziuvnuvn".
        "UuOtqasZueYpKfAkmKcJcWeocQvJguVsZfVovgrztAiryZivHqyMjoLyJdklKifmoWeO".
        "jVnogiiaBzDfrsWlOeAzPxltamqQiujZrpZrUcIlyktdJbhmNpDbltOlLnAqVhcxgObg".
        "hpdcScgIiayqygUgwatiEzgzTsZgApUbbPynLfbzehzWsxcPbdcdfMucsCzjkWvjhMki".
        "WuHfquqrcKwedqghiyHyMkSayRegeJcGw";

$s =~ s/[A-Z]//g;

print(length($s)."\n");
