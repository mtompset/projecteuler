#!/bin/perl -Tw

my @primes;

push @primes, 2;
push @primes, 3;
push @primes, 5;
push @primes, 7;

for (my $number=12; ; $number += 6) {
    print ".";
    $check1 = $number - 1;
    $check2 = $number + 1;

    $divisible = 0;
    for my $prime (@primes) {
        if ($prime * $prime > $check1) {
            last;
        }
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
        if ($prime * $prime > $check2) {
            last;
        }
        if ($check2 % $prime == 0) {
            $divisible = 1;
            last;
        }
    }
    if ($divisible == 0) {
        push @primes, $check2;
    }
    if ($number % 600 == 0) {
        print "$number\n";
    }
    if ($primes[-1] >= 2000000) {
        last;
    }
}
pop @primes;

my $total = 0;
for my $prime (@primes) {
    print "Adding $prime...\n";
    $total += $prime;
}
print "Total: $total\n";
