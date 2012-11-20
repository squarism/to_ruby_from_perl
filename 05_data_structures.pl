# Data structures

@array = (1, 2, 3);
print "First element in array: " . $array[0] . "\n";

%hash = ( "key" => "value" );
print $hash{"key"}, "\n";

# more examples
%hash = ("fire" => "red", "water" => "blue" );
%hash = (
	"fire" 	=> "red",
	"water" => "blue",
	"air"		=> "green",
	"earth"	=> "brown"
);

foreach $key (keys %hash) {
	print "key: $key  value: $hash{$key} \n";
}
# Perl doesn't return anything from this loop so it's hard to
# chain things together.  Also, it's confusing IMHO as to how to
# loop through this hash.  You can do foreach $key (%hash) but
# it returns the values too.

# I feel like I forget how to do things in Perl more often
# even though I've been doing it since 1999.  IDK, I see Perl guys
# forget these basics too.  Especially when dereferencing.  So
# they fire up Data::Dumper to see what state their data is in and then
# put print statements all over the place.  Bleh.

