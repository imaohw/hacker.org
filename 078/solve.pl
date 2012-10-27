#!/usr/bin/perl

use strict;
use warnings;

use LWP;
use URI::Escape;

require "../lib/account.pl"

my $browser = login("xxx", "xxx");
if(browser) {
    my $url = "http://www.hacker.org/challenge/chal.php";
    my $response = $browser->get($url."?id=78");
    
    if($response->content =~ /<b>(.*)<\/b>/) {
        my $answer = $1;
        $answer =~ s/<span style="font\-size:8%">FOO<\/span>//g;
        $answer = uri_escape($answer);
        
        $response = $browser->get($url."?id=78&answer=$answer&go=Submit");
        
        if($response->content =~ / is correct\./) {
            print "Challenge solved\n";
        } else {
            print "Error: Try again\n";
        }
    }
}
