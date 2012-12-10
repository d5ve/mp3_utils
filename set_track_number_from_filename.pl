#!/usr/bin/perl

use strict;
use warnings;

for my $filename (@ARGV) {
    if ( $filename =~ m{ \A (\d+) \s }xms ) {
        my $new_track_num = $1;

        print "Got $new_track_num from '$filename'\n";
    }
    else {
        print "ERROR: Unable to get track number from '$filename'\n";
    }
}
