#!/usr/bin/perl

use strict;
use warnings;

use LWP;

sub login {
    my ($username,$password) = @_;
    
    my $browser = LWP::UserAgent->new;
    $browser->cookie_jar({});
    
    my $url = 'http://www.hacker.org/forum/login.php';
    my $response = $browser->post($url, { username => "$username", 
                                          password => "$password",
                                          redirect => '',
                                          login => 'Log In'
                                        }
                                 );
    if($response->code == 302) {
        $response = $browser->get('http://www.hacker.org');
        if($response->content =~ /$username<\/small>/) {
            print "Successful login\n";
            return $browser;
        } else {
            print "Error on login\n";
            return undef;
        }
    } else {
        print "Error on login\n";
        return undef;
    }
}

1;
