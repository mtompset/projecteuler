#!/bin/perl -Tw

use Data::Dumper;

my $highest = 0;
my $triangle_number = 0;
for my $increment (1..100000) {
    $triangle_number += $increment;
    $factor_count = count_factors($triangle_number, $increment);
    if ($factor_count > $highest || $increment % 1000 == 0) {
        if ($factor_count > $highest) {
            $highest = $factor_count;
        }
        print "$increment: $triangle_number - $factor_count\n";
    }
    if ($factor_count > 500) {
        last;
    }
}

sub count_factors {
    my ($number, $offset) = @_;

#    if ($offset % 1000 == 0) {
#        print "$triangle_number: ";
#    }
    $number_of_factors = 0;
    $upper_limit = int(sqrt($number));
    for my $divisor (1..$upper_limit) {
        if ($number % $divisor == 0) {
            ++$number_of_factors;
#            if ($offset % 1000 == 0) {
#                print "$divisor";
#                if ($divisor == $number) {
#                    print "\n";
#                } else {
#                    print ",";
#                }
#            }
        }
    }
    if ($number > 1) {
        $number_of_factors *= 2;
        if ($upper_limit == sqrt($number)) {
            $number_of_factors -= 1;
        }
    }
    return $number_of_factors;
}
