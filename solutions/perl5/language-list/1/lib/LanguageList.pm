package LanguageList;

use v5.38;

our @Languages;

sub add_language ($language) {
    push @Languages, $language;
}

sub remove_language () {
    pop @Languages;
}

sub first_language () {
    @Languages[0];
}

sub last_language () {
    @Languages[$#Languages];
}

sub get_languages (@elements) {
    my @langs;
    foreach my $elem (@elements) {
        push @langs, @Languages[$elem - 1];
    }
    return @langs;
}

sub has_language ($language) {
    scalar grep { $_ eq $language } @Languages;
}
