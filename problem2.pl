#!/bin/perl

use constant FOUR_MILLION => 4_000_000;

# Calculate the terms less than 4million
my $limit = 1;
my @fibonacci;
$fibonacci[0] = 1;
$fibonacci[1] = 2;
for my $number (2..100) {
    $value = $fibonacci[$number-2] + $fibonacci[$number-1];
    print $number, ": ", $value, "\n";
    $fibonacci[$number] = $value;
    if ($value >= FOUR_MILLION) {
        $limit = $number;
        last;
    }
}

# optimization o,e,o,o,e,o,o,e -- 2,5,8,...,2+3x
$total = 0;
for (my $index = 1;$index < $limit;$index += 3) {
    $total += $fibonacci[$index];
    print "Adding ", $fibonacci[$index], " for a total of ", $total, "\n";
}
