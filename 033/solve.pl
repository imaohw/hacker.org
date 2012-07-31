#!/usr/bin/perl

use strict;
use warnings;
use GD;

require "../lib/account.pl";

my $username = "XXX";
my $password = "XXX";

my $image = new GD::Image(3000,3000);
my $white = $image->colorAllocate(255,255,255);
my $black = $image->colorAllocate(0,0,0);
my $grey = $image->colorAllocate(170,170,170);
my $url = 'http://www.hacker.org/challenge/misc/maze.php?steps=';


my $browser = login($username,$password);
if($browser) {
    no warnings 'recursion';
    solve_maze("D",1500,20);
}

sub save_image {
    open IMAGE, ">maze.png";
    binmode IMAGE;
    print IMAGE $image->png;
    close IMAGE;
}

# Backtracking für den Endsieg
sub solve_maze {
    my ($way,$x,$y) = @_;
    my $response = $browser->get($url.$way);
    my $dir = substr($way,-1,1);

    if($response->code == 503) {
        return solve_maze($way,$x,$y);
    }

    if($response->content =~ /boom$/ or $response->content =~ /off the edge of the world/) {
        print "$way -> boom\n";
        if($dir eq 'D') {
            $image->line($x-5,$y-5,$x+5,$y-5,$black);
        } elsif($dir eq 'R') {
            $image->line($x-5,$y-5,$x-5,$y+5,$black);
        } elsif($dir eq 'L') {
            $image->line($x+5,$y-5,$x+5,$y+5,$black);
        } elsif($dir eq 'U') {
            $image->line($x-5,$y+5,$x+5,$y+5,$black);
        }
        save_image();
        return 1;
    } elsif($response->content =~ /keep moving.../) {
        if($dir ne 'U') {
            if(solve_maze($way.'D',$x,$y+10) == 0) {
                return 0;
            }
        }
        
        if($dir ne 'L') {        
            if(solve_maze($way.'R',$x+10,$y) == 0) {
                return 0;
            }
        } 
        
        if($dir ne 'R') {
            if(solve_maze($way.'L',$x-10,$y) == 0) {
                return 0;
            }
        }

        if($dir ne 'D') {
            if(solve_maze($way.'U',$x,$y-10) == 0) {
                return 0;
            }
        }
        return 1;
    } else {
        print "Ende?!\n";
        print "Way: $way\n";
        print $response->content."\n";
        return 0;
    }
}

