#!/bin/perl -Tw

for my $a (1..999) {
    for my $b (($a+1)..1000) {
        my $c_squared = $a*$a + $b*$b;
        for my $c (($b+1)..1000) {
            if ($c*$c > $c_squared) {
                last;
            }
            if ($c*$c == $c_squared &&  $a+$b+$c == 1000) {
                print "A: $a, B: $b, C: $c, Total: ", $a+$b+$c, "\n";
                print "Product: ", $a*$b*$c, "\n";
            }
        }
    }
}
