# Conditionals
if(true) {
  # true
}

use feature qw( switch );
$x = 'tacos';
given ($x) {
  when('tacos') {
    print "i love tacos.\n";
  }
  when('milk') {
    # it's too hot for milk
  }
  default {
    # fallthrough
  }
}
