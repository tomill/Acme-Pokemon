use strict;
use warnings;
use utf8;
use Test::More;

use Acme::Pokedex;
my $pokemon = Acme::Pokedex->lookup(id => 25);

ok($pokemon, 'lookup returns true');
ok($pokemon->isa('Acme::Pokemon'), 'lookup returns object');
is($pokemon->name, 'ピカチュウ', "name()");
is($pokemon->id,  25, "id()");
is($pokemon->kid, 25, "kid()");
is($pokemon->jid, 22, "jid()");
is($pokemon->hid, 156, "hid()");
is($pokemon->sid, 104, "sid()");
is($pokemon->iid, undef, "iid()");
is_deeply($pokemon->type, ['Electric'], "type()");

done_testing();
