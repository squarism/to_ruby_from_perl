# Primatives
$x = 1;
$string = "hello";

use Scalar::Util qw(looks_like_number);
if(looks_like_number($x)) {
  print "$x looks like a number to me.\n";
}
