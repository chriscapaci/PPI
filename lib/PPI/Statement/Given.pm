package PPI::Statement::Given;

=pod

=head1 NAME

PPI::Statement::Given - Describes all compound statements

=head1 SYNOPSIS

  given ( foo ) {
      say $_;
  }

=head1 INHERITANCE

  PPI::Statement::Given
  isa PPI::Statement
      isa PPI::Node
          isa PPI::Element

=head1 DESCRIPTION

C<PPI::Statement::Given> objects are used to describe switch statements, as
described in L<perlsyn>.

=head1 METHODS

C<PPI::Structure::Switch> has no methods beyond those provided by the
standard L<PPI::Structure>, L<PPI::Node> and L<PPI::Element> methods.

Got any ideas for methods? Submit a report to rt.cpan.org!

=cut

use strict;
use PPI::Statement ();

use vars qw{$VERSION @ISA};
BEGIN {
	$VERSION = '1.204_06';
	@ISA     = 'PPI::Statement';
}

# Lexer clues
sub __LEXER__normal { '' }

sub _complete {
	my $child = $_[0]->schild(-1);
	return !! (
		defined $child
		and
		$child->isa('PPI::Structure::Block')
		and
		$child->complete
	);
}





#####################################################################
# PPI::Node Methods

sub scope () { 1 }

1;

=pod

=head1 TO DO

- Write unit tests for this package

=head1 SUPPORT

See the L<support section|PPI/SUPPORT> in the main module.

=head1 AUTHOR

Adam Kennedy E<lt>adamk@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2001 - 2009 Adam Kennedy.

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=cut