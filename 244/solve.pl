#!/usr/bin/perl 

# Copyright (c) 2012, Sebastian Köhler<sebkoehler@whoami.org.uk>

use strict;
use warnings;

require "../lib/math.pl";

open FILE, "<ins.txt";
while(<FILE>) {
    my $inst = $_;
    chomp($inst);
    
    $inst = hex_to_bin_instruction($inst);
    $inst = bin_to_asm($inst);

    print("$inst\n");
}

close FILE;

sub bin_to_asm {
    my ($inst) = @_;
    
    if(substr($inst, 0, 6) eq "000000") {
        my $rs = bin2dec(substr($inst, 6, 5));
        my $rt = bin2dec(substr($inst, 11, 5));
        my $rd = bin2dec(substr($inst, 16, 5));
        my $sa = bin2dec(substr($inst, 21, 5));

        if (substr($inst, 26, 6) eq "000000") {
            $inst = "sll \$$rd,\$$rt,$sa";
        } elsif (substr($inst, 26, 6) eq "000011") {
            $inst = "sra \$$rd,\$$rt, $sa";
        } elsif (substr($inst, 26, 6) eq "000100") {
            $inst = "sllv \$$rd,\$$rt,\$$rs";
        } elsif (substr($inst, 26, 6) eq "001100") {
            $inst =  "syscall";
        } elsif (substr($inst, 26, 6) eq "001101") {
            #$inst = "break";
            $inst = "nop";
        } elsif (substr($inst, 26, 6) eq "010010") {
            $inst = "mflo \$$rd";
        } elsif (substr($inst, 26, 6) eq "011010") {
            $inst = "div \$$rs,\$$rt";
        } elsif (substr($inst, 26, 6) eq "100000") {
            $inst = "add \$$rd,\$$rs,\$$rt";
        } elsif (substr($inst, 26, 6) eq "100001") {
            $inst = "addu \$$rd,\$$rs,\$$rt";
        } elsif (substr($inst, 26, 6) eq "100010") {
            $inst = "sub \$$rd,\$$rs,\$$rt";
        }
    } elsif (substr($inst, 0, 6) eq "011100") {
        my $rs = bin2dec(substr($inst, 6, 5));
        my $rt = bin2dec(substr($inst, 11, 5));
        my $rd = bin2dec(substr($inst, 16, 5));
        my $sa = bin2dec(substr($inst, 21, 5));

        if (substr($inst, 26, 6) eq "000010") {
            $inst = "mul \$$rd,\$$rs,\$$rt";
        }
    } elsif (substr($inst, 0, 6) eq "001001") {
        my $rs = bin2dec(substr($inst, 6, 5));
        my $rt = bin2dec(substr($inst, 11, 5));
        my $imm = bin2dec(substr($inst, 16, 16));

        $inst = "addiu \$$rt,\$$rs,$imm";
    } elsif (substr($inst, 0, 6) eq "000101") {
        my $rs = bin2dec(substr($inst, 6, 5));
        my $rt = bin2dec(substr($inst, 11, 5));
        my $imm = bin2dec(substr($inst, 16, 16));

        #$inst = "bne \$$rs,\$$rt, $imm";
        $inst = "nop";
    }

    return $inst;
}

sub hex_to_bin_instruction {
    my ($inst) = @_;

    $inst = sprintf("%b", hex($inst));

    while(length($inst) < 32) {
        $inst = "0" . $inst;
    }

    return $inst;
}
