#!/bin/perl -Tw

use Data::Dumper;

$number_to_factor = 600851475143;
print "Factoring ", $number_to_factor, "\n";

my @factors;

for (my $factor = 2;$factor <= $number_to_factor; ++$factor) {
    if ($number_to_factor % $factor == 0) {
        $number_to_factor = $number_to_factor / $factor;
        push @factors, $factor;
        $factor -= 1;
    }
}
print Dumper(\@factors);
