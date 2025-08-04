package HighScoreBoard;

use v5.38;

our %Scores;

sub set_player_scores (%new_scores) {
    %Scores = (%Scores, %new_scores)
}

sub get_player_score ($player) {
    $Scores{$player};
}

sub increase_player_scores (%additional_scores) {
    foreach my $player (keys %additional_scores) {
        $Scores{$player} += $additional_scores{$player};
    }
}

sub sort_players_by_name {
    sort { $a cmp $b } keys %Scores;
}

sub sort_players_by_score {
    sort { $Scores{$b} cmp $Scores{$a} } keys %Scores;
}

sub delete_player ($player) {
    delete $Scores{$player};
}
