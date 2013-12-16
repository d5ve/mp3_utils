#!/usr/bin/perl

use strict;
use warnings;

=head1 NAME

fix_compilation_filenames_and_tags.pl - Fix some common annoyances with ripped compilation albums

=head1 DESCRIPTION

This script changes mp3 tags and filenames of compilation albums to my
preferred way. This includes setting the "album artist" tag to the album name
so that players group all the tracks together correctly. Plus any multi-disk
albums are changed so that all the mp3 files are in a single directory, with
the track number made of the disk number and the disk track number.


Currently two steps are performed.

1) Set "Album Artist" to album name. This is the TPE2
(Band/orchestra/accompaniment) tag.

2) Rename file to  "{disk number}{track number} - {title} - {artist}.mp3"

=cut

use autodie;
use MP3::Tag;

if ( ! @ARGV ) {
    print "USAGE: fix_compilation_filenames_and_tags.pl <mp3 filename> [<mp3 filename> ...]\n";
    exit;
}

exit;

=head1 AUTHOR

Dave Webb L<mp3utils.github@d5ve.com>

=head1 LICENSE

B<fix_compilation_filenames_and_tags.pl> is free software. It comes without any
warranty, to the extent permitted by applicable law.

B<fix_compilation_filenames_and_tags.pl> is released under the I<WTFPL Version
2.0> license - L<http://sam.zoy.org/wtfpl/COPYING>

0. You just DO WHAT THE FUCK YOU WANT TO.

=cut
