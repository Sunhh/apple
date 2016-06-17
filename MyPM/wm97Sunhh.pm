package wm97Sunhh; 

use strict; 
use warnings; 
use LogInforSunhh; 

sub new {
	my $class = shift; 
	my $self = {}; 
	bless $self, $class; 
	
	$self->_initialize(@_); 

	return $self; 
}

sub _initialize {
	my $self = shift; 
	my %parm = @_; 
	return ; 
}


################################################################################
# Sub-routines. 
################################################################################
=head1 number_to_chrID( $number, $prefix, $length_of_number )

$number           : Required, 0-11

$prefix           : 'WM97_Chr'

$length_of_number : 2

Return : chrID_string

=cut
sub number_to_chrID {
	my ($n, $p, $l) = @_; 
	$p //= 'WM97_Chr'; 
	$l //= 2; 
	my $id = $p . sprintf("%0${l}d", $n); 
	return $id; 
}

=head1 chrID_to_number( $chrID, $prefix )

$chrID           : Required. Such as 'WM97_Chr01'
$prefix          : 'WM97_Chr'

Return   : number_of_chr

=cut
sub chrID_to_number {
	my ($id, $p) = @_; 
	$p //= 'WM97_Chr'; 
	$id =~ s!^$p!!; 
	$id =~ s!^0*(.+?)$!$1!; 
	return $id; 
}

1; 

