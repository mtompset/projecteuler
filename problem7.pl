#!/bin/perl -Tw

my @primes;

push @primes, 2;
push @primes, 3;
push @primes, 5;
push @primes, 7;

for (my $number=12; ; $number += 6) {
    $check1 = $number - 1;
    $check2 = $number + 1;

    $divisible = 0;
    for my $prime (@primes) {
        if ($check1 % $prime == 0) {
            $divisible = 1;
            last;
        }
    }
    if ($divisible == 0) {
        push @primes, $check1;
    }

    $divisible = 0;
    for my $prime (@primes) {
        if ($check2 % $prime == 0) {
            $divisible = 1;
            last;
        }
    }
    if ($divisible == 0) {
        push @primes, $check2;
    }
    if (@primes > 10001) {
        last;
    }
}
print $primes[10000], "\n";
