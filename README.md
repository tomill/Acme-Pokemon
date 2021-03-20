# NAME

Acme::Pokemon - A Pokémon object

# SYNOPSIS

    use Acme::Pokedex;
    my $pokemon = Acme::Pokedex->lookup( ... );
    my $name = $pokemon->name;

# DESCRIPTION

Acme::Pokemon is a Pokemon object.

This is a beta library, API may be changed in the future.

# METHODS

- new()

    You should get new Acme::Pokemon object by [Acme::Pokedex](https://metacpan.org/pod/Acme%3A%3APokedex).

- name()

        print $pokemon->name; # ピカチュウ

    Returns Pokemon name.

    Note: This object has not yet been i18n, returns a Japanese name, so far.

- id()

        print $pokemon->id; # 25

    Returns Pokemon Zenkoku Number.

- kid(), jid(), hid(), sid(), iid()

        print $pokemon->kid; # 25
        print $pokemon->jid; # 22
        print $pokemon->hid; # 156
        print $pokemon->sid; # 104
        print $pokemon->iid; # undef

    Returns Kanto Number, Johto Number, Hoenn Number, Shinnoh Number, Ish Number.

- type()

        print $pokemon->type; # ['Electric']

    Returns Pokemon types as ArrayRef.

# SEE ALSO

[Acme::Pokedex](https://metacpan.org/pod/Acme%3A%3APokedex)

# AUTHOR

Naoki Tomita <tomita@cpan.org>

# COPYRIGHT

This data is based on [http://wiki.xn--rckteqa2e.com/](http://wiki.xn--rckteqa2e.com/).

Content is available under the Creative Commons BY-NC-SA 2.5 licence.

[http://creativecommons.org/licenses/by-nc-sa/2.5/](http://creativecommons.org/licenses/by-nc-sa/2.5/)
