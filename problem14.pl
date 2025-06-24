#!/bin/perl -Tw

use Data::Dumper;

my $longest = 0;
for my $number (1..999999) {
    $length = iterate_rules($number, 1);
    if ($length > $longest) {
        print "$number: $length\n";
        $longest = $length;
    }
}
    

sub apply_rules {
    my ($value) = @_;

    if ($value % 2 == 0) {
        return $value / 2;
    } else {
        return 3 * $value + 1;
    }
}

sub iterate_rules {
    my ($start, $depth) = @_;

    my $current_value = $start;
    while ($current_value > 1) {
        $current_value = apply_rules($current_value);
        $depth++;
    }
    return $depth;
}
