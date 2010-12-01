use strict;
use warnings;
use Web::Scraper;
use URI;
use utf8;
use Data::Dump qw/dump/;
use Time::HiRes qw/sleep/;

my %type_map = qw(
    ノーマル    Normal
    ほのお      Fire
    みず        Water
    でんき      Electric
    くさ        Grass
    こおり      Ice
    かくとう    Fighting
    どく        Poison
    じめん      Ground
    ひこう      Flying
    エスパー    Psychic
    むし        Bug
    いわ        Rock
    ゴースト    Ghost
    ドラゴン    Dragon
    あく        Dark
    はがね      Steel
    ???         ???
);

my $pokedex = get_list(do {
    my $uri = URI->new('http://wiki.xn--rckteqa2e.com');
    $uri->path("wiki/ポケモン一覧");
    $uri;
});

dump $pokedex;

for my $id (keys %$pokedex) {
    $pokedex->{$id} = get_detail(do {
        my $uri = URI->new('http://wiki.xn--rckteqa2e.com/w/index.php');
        $uri->query_form({ title => $pokedex->{$id}, action => 'edit' });
        $uri;
    });
    dump $pokedex->{$id};
    sleep 0.5;
}

while (<DATA>) {
    s/<pokedex>/dump $pokedex/e;
    print;
}

exit;


sub get_list {
    my ($url) = @_;
    my $scraper = scraper {
        process '//table/tr',
            'list[]' => scraper {
                process '//td[1]',
                    'id' =>  [ 'TEXT', sub { s/[^\d]//g } ];
                process '//td[2]/a[1]',
                    'name' => 'TEXT';
            };
    };
    
    my $result = $scraper->scrape($url);
    my %list;
    for my $item (@{ $result->{list} }) {
        next unless defined $item->{id};
        $list{ $item->{id} - 0 } ||= $item->{name};
    }

    \%list;
}

sub get_detail {
    my ($url) = @_;
    my $scraper = scraper {
        process '#wpTextbox1',
            'content' => 'TEXT';
    };

    my $content = $scraper->scrape($url)->{content};
    my %detail;
    ($detail{name}{ja}) = $content =~ /^名=(.+?)[ \|]/m;
    
    ($detail{kid}) = $content =~ /^ndex=0*(\d+)/m;
    ($detail{jid}) = $content =~ /^jdex=0*(\d+)/m;
    ($detail{hid}) = $content =~ /^hdex=0*(\d+)/m;
    ($detail{sid}) = $content =~ /^sdex=0*(\d+)/m;
    ($detail{iid}) = $content =~ /^idex=0*(\d+)/m;
    
    for my $type ($content =~ /^type\d=(.+?) /gm) {
        push @{ $detail{type} ||= [] }, $type_map{$type};
    }

    \%detail;
}

__DATA__
package Acme::Pokedex;
use 5.008001;
use strict;
use warnings;
our $VERSION = '0.01';
use utf8;
use Carp;
use Acme::Pokemon;

my $pokedex;

sub lookup {
    my ($class, %param) = @_;
    croak "Search params are required." unless %param;
    if (my $id = $param{id}) {
        Acme::Pokemon->new($pokedex->{$id}) if $pokedex->{$id};
    }
}

$pokedex = <pokedex>;

1;
__END__

=encoding utf-8

=head1 NAME

Acme::Pokedex - Pokédex module

=head1 SYNOPSIS

  use Acme::Pokedex;
  my $pokemon = Acme::Pokedex->lookup(id => 25);

=head1 DESCRIPTION

Acme::Pokedex is the interface to retrieve a L<Acme::Pokemon> object.

This is a beta library, API may be changed in the future.

=head1 METHODS

=over 4

=item lookup( %query )

Return a L<Acme::Pokemon> object by %query.

Currently, only C<id> is supported.

=over 4

=item * id => Zenkoku-Number

=back

=back

=head1 AUTHOR

Naoki Tomita E<lt>tomita@cpan.orgE<gt>

=head1 COPYRIGHT

This data is based on L<http://wiki.xn--rckteqa2e.com/>.

Content is available under the Creative Commons BY-NC-SA 2.5 licence.

L<http://creativecommons.org/licenses/by-nc-sa/2.5/>

=cut
