#!/bin/perl -Tw

use Data::Dumper;

my @primes;
push @primes, 2; 
for my $number (3..20) {
    my $is_prime = 1;
    for my $prime (@primes) {
        if ($number % $prime == 0) {
            $is_prime = 0;
            last;
        }
    }
    if ($is_prime) {
        push @primes, $number;
    }
}

my @all_factors;
for my $number (2..20) {
    my @factors_of_number = factor($number);
    my @check_all_factors = sort { $a <=> $b } @all_factors;
    $#all_factors = -1;
    while (@check_all_factors != 0 || @factors_of_number != 0) {
        if (@check_all_factors == 0) {
            push @all_factors, $factors_of_number[0];
            shift @factors_of_number;
        } elsif (@factors_of_number == 0) {
            push @all_factors, $check_all_factors[0];
            shift @check_all_factors;
        } elsif ($factors_of_number[0] < $check_all_factors[0]) {
            push @all_factors, $factors_of_number[0];
            shift @factors_of_number;
        } elsif ($factors_of_number[0] == $check_all_factors[0]) {
            push @all_factors, $factors_of_number[0];
            shift @factors_of_number;
            shift @check_all_factors;
        } else {
            push @all_factors, $check_all_factors[0];
            shift @check_all_factors;
        }
    }
    print $number, ": ", join ", ", @all_factors, "\n";
}

$result = 1;
for my $value (@all_factors) {
    $result = $result * $value;
}
print "Lowest multiple: $result\n";

sub factor {
    my ($number_to_factor) = @_;

    my @factors;
    for (my $factor = 2;$factor <= $number_to_factor; ++$factor) {
        if ($number_to_factor % $factor == 0) {
            $number_to_factor = $number_to_factor / $factor;
            push @factors, $factor;
            $factor -= 1;
        }
    }
    return @factors;
}
