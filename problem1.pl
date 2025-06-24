#!/bin/perl -Tw

my $total = 0;
for my $number (1..999) {
    if (($number % 3 == 0) || ($number % 5 == 0)) {
        print "Adding ", $number, "\n";
        $total += $number;
        print "Total: ", $total, "\n";
    }
}
