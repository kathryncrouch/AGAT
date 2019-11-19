#!/usr/bin/env perl

use strict;
use warnings;
use Agat::Omniscient;

use Test::Simple tests => 6; # half of file to test but each tested twice

=head1 DESCRIPTION

Test to verify the method detecting the gff parser version to use with bioperl.

=cut

# script to call to check the parser
my $handler_script = "bin/agat_sp_gxf_to_gff3.pl";
my $pathtmp= "tmp.gff"; # path file where to save temporary output
my $pathtmp2= "tmp2.gff"; # path file where to save temporary output

opendir (DIR, "t/gff_version") or die $!;
while (my $file = readdir(DIR)) {

  # for all test files
  if ( $file =~ m/test.gff$/ ){

    # format detected by select_gff_format
    my $format = select_gff_format("t/gff_version/$file");
    # first character is the format of the file expected
    my $firstchar = substr $file, 0, 1;

    ok( $firstchar == $format, "Good version found for $file");
  }
}
closedir(DIR);