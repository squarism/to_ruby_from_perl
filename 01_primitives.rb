section_spacer "01. Primatives"

x = 1
string = "hello"
string = 'hello'
# you don't need to use a dollar sign, like $string

# this is a constant
PI = 3.14159

# There's no such thing as scalars in Ruby.  Which is a blessing, because
# figuring out what kind of variable you have is annoying.  In Ruby, x is a Fixnum
# and string is a String.
if(x.class == Fixnum)
  print "#{x} looks like a number to me.\n";
end

# ok so what's up with that end?
# this is an if else statement:
if(true)
  # true stuff here
else
  # false stuff here
end

# a lot of ruby stuff has end at the end, some things will actually take braces
# {
# }
# but most of the time, just look at end and see }

# the if statement if(true) also isn't really "ruby", most things won't need
# parens() unless the language can't figure out which order you mean.  Let's
# talk about that.