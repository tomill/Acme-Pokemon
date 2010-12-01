use inc::Module::Install;
all_from 'lib/Acme/Pokemon.pm';

requires 'Any::Moose';

test_requires 'Test::More' => 0.94; # subtest

author_tests 'xt';

readme_from 'lib/Acme/Pokemon.pm';
resources(
    repository => 'http://github.com/tomi-ru/Acme-Pokemon',
    bugtracker => 'http://github.com/tomi-ru/Acme-Pokemon/issues',
);

auto_install;
WriteAll;
