# Subroutines (Methods in Ruby)

sub foo {
	print "foo!\n";
}

# same thing
sub foo { print "foo redefined!\n"; }

sub add {
	$one_thing = shift;
	$another_thing = shift;
	return $one_thing + $another_thing;
}

foo;
print add(1,2) . "\n";


# So let's say that we wanted to write chop() by hand.

sub addW {
  $string = $_[0];
  $string = $string . "w";
}
sub addT {
  $string = $_[0];
  $string = $string . "t";
}
sub addF {
  $string = $_[0];
  $string = $string . "f";
}

$string = "";
print addF(addT(addW($string))) . "\n";


$string = "Please chop off this period.";
$reversed = reverse($string);
$chopped = substr $reversed, 1;
$reversed_again = reverse($chopped);
print "$reversed_again\n";


chop($string);
print $string, "\n";

# ruby has default parameters
sub foo {
	my $x = defined $_[0] ? $_[0] : 'yes';
	print "default parameters: Foo is $x\n";
}

foo;
foo(1);
