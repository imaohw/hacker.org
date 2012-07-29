#!/usr/bin/perl

use strict;
use warnings;

use CGI::Fast;

my $cgi = new CGI::Fast;

my $vars = {};

while(my $cgi = new CGI::Fast) {
    main($cgi);
}

sub main {
    my $cgi = shift;
    my $set = $cgi->param('set');
    my $get = $cgi->param('get');
    
    print $cgi->header();

    if($set) {
        $vars->{$set} = 1;
    }

    if($get) {
        if($vars->{$get}) {
            print "yes"
        } else {
            print "no";
        }
    }
}
