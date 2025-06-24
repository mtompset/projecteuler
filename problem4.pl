#!/bin/perl -Tw

my $highest_palindrome = 0;
for (my $number1 = 999; $number1 >= 100; --$number1) {
    my $found = 0;
    for (my $number2 = 999; $number2 >= 100; --$number2) {
        $value = $number1 * $number2;
        print "Checking $value\n";
        if (is_palindromic($value)) {
            print "\n";
            print "Palindrome: ", $value, " = ", $number1,  " * ", $number2, "\n";
            $found = $value;
            last;
        }
    }
    if ($found > 0) {
        if ($found > $highest_palindrome) {
            $highest_palindrome = $found;
        }
    }
}
print "Highest Palindrome: $highest_palindrome\n";

sub is_palindromic {
    my ($number_to_check) = @_;

    $string = sprintf('%d', $number_to_check);
    for my $index (0..length($string)) {
        if (substr($string, $index, 1) ne substr($string, -($index+1), 1)) {
            return 0;
        }
    }
    return 1;
}
