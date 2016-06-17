#!/usr/bin/perl
use strict; 
use warnings; 
use LogInforSunhh; 

my $geno_col = 2; 
-t and !@ARGV and die "perl $0 in_wiSame.snp\nPlease note that geno_col=$geno_col\nHere we treat heterozygous site as 'N', with indel accepted.\n"; 


while (<>) {
	$. % 1e6 == 1 and &tsmsg("[Msg] Reading $. lines.\n"); 
	s/[^\S\t]+$//; 
	my @ta = split(/\t/, $_); 
	if ( $ta[0] eq 'chr' ) {
		print "$_\n"; 
		next; 
	}
	my $base = 'N'; 
	my $has_diff = 0; 
	for (my $i=$geno_col; $i<@ta; $i++) {
		$ta[$i] = uc($ta[$i]); 
		$ta[$i] =~ m/^[ATGC]$|\*|\+/ or $ta[$i] = 'N'; 
		$ta[$i] eq 'N' and next; 
		$base eq 'N' and $base = $ta[$i]; 
		$base ne $ta[$i] and do { $has_diff = 1; last; }; 
	}
	$has_diff == 1 and print "$_\n"; 
}
