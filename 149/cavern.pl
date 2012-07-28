#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw(shuffle);
use LWP;

my $username = "XXX";
my $password = "XXX";

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

sub run_bot {
    my $url = 'http://www.hacker.org/challenge/misc/d/cavern.php';
    my $arguments = '';
    
    my $level = 0;
    my $ulvl = 0;
    my $hp = 0;
    my $xp = 0;
    my $weapon = "N/A";

    my @mv = ();

    while(1) { 
        my $response = $browser->get($url.$arguments);
        $arguments = '';
        @mv = ();
        
        if($response->content =~ /<img src=img\/death.png><br>/) {
            print "Tod\n";
            last;
        }

        if($response->content =~ /<h2>Dungeon Level (.*)<\/h2><p>/) {
            $level = $1;
        }
        if($response->content =~ /<tr><td>(.*?)<\/td><td>(.*?)<\/td><td>(.*?)<\/td><td>(.*?)<\/td><\/tr>/) {
            ($ulvl, $hp, $xp, $weapon) = ($1, $2, $3, $4);
        }
        
        print "Level: $level, User: $ulvl, HP: $hp, XP: $xp, Weapon: $weapon";
        
        if($response->content =~ /<a href="cavern\.php\?tres=1">/) {
            $arguments = '?tres=1';
            print " -> Yay ein Schatz\n";
            next;
        }

        if($response->content =~ /<a href=cavern\.php\?attack=1>Attack!<\/a>/) {
            if($response->content =~ /<h2>Dungeon Level (.*)<\/h2><p>\n(.*?)<br>/) {
                print " -> $2";
            }
            
            $arguments = '?attack=1';
            print " -> ATTTTTAAAAAACCCCCKKKKKEEEEEE\n";
            next;
        }

        if($response->content =~ /<a href=cavern\.php\?m=d>Down Stairs<\/a>/) {
            if(($level + 5) <= $ulvl) {
                $arguments = '?m=d';
                print " -> Le fu, hier gehts noch tiefer\n";
                next;
            }
        }

        if($response->content =~ /<a href=cavern\.php\?m=e>East<\/a>/) {
            push(@mv, 'e');
        }
        if($response->content =~ /<a href=cavern\.php\?m=s>South<\/a>/) {
            push(@mv, 's');
        }
        if($response->content =~ /<a href=cavern\.php\?m=n>North<\/a>/) {
            push(@mv, 'n');
        }
        if($response->content =~ /<a href=cavern\.php\?m=w>West<\/a>/) {
            push(@mv, 'w');
        }
        
        if(!@mv) {
            print " -> ENDE!?\n";
            last;
        }

        @mv = shuffle(@mv);
        my $arg = pop(@mv);
        $arguments = '?m=' . $arg;
        print " -> $arg\n";
    }
}

if(login() == 0) {
    run_bot();
}

