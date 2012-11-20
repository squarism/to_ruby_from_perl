section_spacer "03. Methods"  # ... or Subroutines in Perl

def foo
  puts "foo!"
end

# same thing just on one line so we have to use ;
def foo; puts "foo redefined!"; end

def add(one_thing, another_thing)
  return one_thing + another_thing
end

# same thing, minus parens
def add one_thing, another_thing
  one_thing + another_thing  # last line in method is the return value
end

foo            # call foo
puts add(1,2)  # call add (we redefined it, so it's really calling the 2nd one)

# Ok here's the thing.  That's the syntax.  But that's not the spirit.  The
# spirit is more like sending messages.
puts Kernel.send(:add, 3, 4)

# Ok that's a little weird because we're not in a class.  Add is like defined
# on the main.  So we'll get to classes next.  But also, WTF IS THAT :add THING?

puts :this_is_a_symbol
# it's just a special kind of string.  It can't have - in it.  So a lot of times
# it makes for great keys and almost constants.  They are used everywhere.
# You can just thing of them as keys.

# You can turn any string into a symbol, but normally you won't need to.
puts "just fyi".to_sym.class
# if you print a symbol, puts is going to call .to_s on it
puts "string to symbol back to string".to_sym


# So let's say that we wanted to write chop() by hand.

def add_w(string)
  string << "w"
end
def add_t(string)
  string << "t"
end
def add_f(string)
  string << "f"
end

puts add_f(add_t(add_w("")))  # same as perl, really hard to read

# Now the difference is, Ruby gives us flexibility if we want to
# monkey patch String to make this more readable.  Most of the time you won't
# do this.  But this will illustrate how we can chain methods together.
class Wtfer < String
  def add_w
    self << "w"
  end
  def add_t
    self << "t"
  end
  def add_f
    self << "f"
  end
end

wtfer = Wtfer.new ""
puts wtfer.add_w.add_t.add_f

# Ruby passes the message to the left <---


# Ok that's a bit weird.  Bad example.  Most of the time you'll be chaining
# together cooler and clearer stuff than that.  For example, let's say you
# wanted to reverse a string, split on the first character and return the second
# half.  So like writing your own Perl chomp.

string = "Please chop off this period."
string.reverse[1,string.length].reverse

# ok so ruby doesn't have a substr() which makes this a bit confusing.  :(
# can't say I'm stacking the deck against Perl!
# the data looks like this:
#  .reverse             ".doirep siht ffo pohc esaelP"
#  [1,string.length]    "doirep siht ffo pohc esaelP"
#  .reverse             "Please chop off this period"

# [1,string.length] is like substr().  You can treat a string like an array.
# "asdf"[0] is "a"
# "asdf"[0] is "s"

# USE THE REPL (read eval print loop).  Fire up irb or pry.  Pry is best.
# This is why you use the REPL, irb to figure this out.
# Then start writing code files when it gets too long or annoying to retype.
# Then write short, clear and descriptive methods.
# But first, play around in the REPL (irb).

# or just use chop
string = "Please chop off this period."
puts string.chop  # perl returns the character chopped
# ruby will leave string alone but return the string result
# ruby has a naming convention (by name only) of naming destructive methods
# with a bang!.  Look at the difference.

string = "Please chop off this period."
string.chop
puts string
string.chop!  # destructive version
puts string

# ruby has default parameters
def foo(x='yes')
  puts "default parameters: Foo is #{x}"
end
foo
foo(1)

section_spacer "Ok enough of the boring string stuff."