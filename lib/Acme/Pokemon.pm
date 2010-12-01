package Acme::Pokemon;
use strict;
use warnings;
use Any::Moose;

has [qw(id type _name kid jid hid sid iid )] => (is => 'ro');

sub name {
    my ($self) = @_;
    $self->_name->{ja};
}

1;
__END__

=encoding utf-8

=head1 NAME

Acme::Pokemon - A Pokémon object

=head1 SYNOPSIS

  use Acme::Pokedex;
  my $pokemon = Acme::Pokedex->lookup( ... );
  my $name = $pokemon->name;

=head1 DESCRIPTION

Acme::Pokemon is a Pokemon object.

This is a beta library, API may be changed in the future.

=head1 METHODS

=over 4

=item new()

You should get new Acme::Pokemon object by L<Acme::Pokedex>.

=item name()

  print $pokemon->name; # ピカチュウ

Returns Pokemon name.

Note: This object has not yet been i18n, returns a Japanese name, so far.

=item id()

  print $pokemon->id; # 25

Returns Pokemon Zenkoku Number.

=item kid(), jid(), hid(), sid(), iid()

  print $pokemon->kid; # 25
  print $pokemon->jid; # 22
  print $pokemon->hid; # 156
  print $pokemon->sid; # 104
  print $pokemon->iid; # undef

Returns Kanto Number, Johto Number, Hoenn Number, Shinnoh Number, Ish Number.

=item type()

  print $pokemon->type; # ['Electric']

Returns Pokemon types as ArrayRef.

=back

=head1 SEE ALSO

L<Acme::Pokedex>

=head1 AUTHOR

Naoki Tomita E<lt>tomita@cpan.orgE<gt>

=head1 COPYRIGHT

This data is based on L<http://wiki.xn--rckteqa2e.com/>.

Content is available under the Creative Commons BY-NC-SA 2.5 licence.

L<http://creativecommons.org/licenses/by-nc-sa/2.5/>

=cut
