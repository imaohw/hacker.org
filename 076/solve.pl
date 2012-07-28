#!/usr/bin/perl

use strict;
use warnings;

use LWP;
use URI::Escape;

my $username = "whoami";
my $password = "hund1234";

my $browser = LWP::UserAgent->new;
$browser->cookie_jar({});

sub login {
    my $url = 'http://www.hacker.org/forum/login.php';
    my $response = $browser->post($url,
        [ username => "$username", 
          password => "$password",
          redirect => '',
          login => 'Log In'
        ]);
    if($response->code == 302) {
        $response = $browser->get('http://www.hacker.org');
        if($response->content =~ /$username<\/small>/) {
            print "Successful login\n";
            return 0;
        } else {
            print "Error on login\n";
            return 1;
        }
    } else {
        print "Error on login\n";
        return 1;
    }
}

if(login == 0) {
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
