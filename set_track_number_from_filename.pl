#!/usr/bin/perl

use strict;
use warnings;

use autodie;
use MP3::Tag;

if ( ! @ARGV ) {
    print "USAGE: set_track_number_from_filename.pl <mp3 filename> [<mp3 filename> ...]\n";
    exit;
}

my $potential_changes;

for my $filename (@ARGV) {
    if ( $filename =~ m{ \A (\d+) \s }xms ) {
        my $new_track_num = $1;
        my $mp3 = MP3::Tag->new($filename);
        my $old_track_num = $mp3->track();
        if ( $new_track_num == $old_track_num ) {
            print "No change to $new_track_num required for '$filename'\n";
        }
        else {
            $potential_changes ++;
            print "Would change $old_track_num to $new_track_num for '$filename'\n";
        }

    }
    else {
        print "ERROR: Unable to get track number from '$filename'\n";
    }
}

if ( ! $potential_changes ) {
    print "Nothing to be done. Exiting...\n";
    exit;
}


print "Do you want to edit the tags (Y/N): ";
my $confirm = <STDIN>;
chomp $confirm;

if ( uc $confirm eq 'Y' || uc $confirm eq 'YES' ) {
    for my $filename (@ARGV) {
        if ( $filename =~ m{ \A (\d+) \s }xms ) {
            my $new_track_num = $1;
            my $mp3 = MP3::Tag->new($filename);
            my $old_track_num = $mp3->track();
            if ( $new_track_num == $old_track_num ) {
                print "No change to $new_track_num required for '$filename'\n";
            }
            else {
                print "Changing $old_track_num to $new_track_num for '$filename'\n";
                $mp3->update_tags({ track => $new_track_num });
            }
        }
        else {
            print "ERROR: Unable to get track number from '$filename'\n";
        }
    }

}
else {
    print "Exiting without making any changes...\n";
}

exit;
