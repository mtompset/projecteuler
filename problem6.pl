#!/bin/perl -Tw

$number = 100;

$number_to_square = $number * ($number+1) / 2;
$squared = $number_to_square * $number_to_square;

$total = 0;
for my $value (1..$number) {
    $total += $value * $value;
}
print "Total of squares: $total\n";
print "Sum squared: $squared\n";

$difference = $squared - $total;
print $difference, "\n";
