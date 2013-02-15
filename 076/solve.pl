#!/usr/bin/perl

use strict;
use warnings;

require "../lib/account.pl";

use URI::Escape;

my $username = "xxx";
my $password = "yyy";

my $browser = login($username, $password);

if($browser) {
    my $url = "http://www.hacker.org/challenge/chal.php";
    my $response = $browser->get($url."?id=76");
    
    if($response->content =~ /<b>(.*) <\/b>/) {
        my $answer = uri_escape($1);
        $response = $browser->get($url."?id=76&answer=$answer&go=Submit");
        
        if($response->content =~ / is correct\./) {
            print "Challenge solved\n";
        } else {
            print "Error: Try again\n";
        }
    }
}
