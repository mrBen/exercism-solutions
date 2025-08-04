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
    map { @Languages[$_ - 1] } @elements
}

sub has_language ($language) {
    grep { $_ eq $language } @Languages;
}
