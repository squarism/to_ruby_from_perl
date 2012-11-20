# to ruby from perl

# Hey listen, this is all syntax stuff.
# Unfortunately, "switching" languages isn't just about syntax.  It's about
# style, community, conventions and world view.  So this can never be an
# end-all guide.

# We're going to start off the wrong way and talk about primitives first.
# This is a horrifyingly bad way to teach.  But we're going to do it anyway.

# Take comfort in my opinion that the switch from Perl to Ruby is a good move.
# And many of the Perlisms will seem familiar to you.  However, what you gain
# in readability, modernization, power, speed and happiness might change you
# as a coder in the best ways possible.  I have no control group but I have
# enjoyed computer science more since learning Ruby.  It truely is a thing of
# beauty.

# This file is just a utility program to kick off the numbered lessons.
# In other words, ignore the below.
# The ruby files (.rb) will mostly pair up with the perl files (.pl)

# Also, Google "Ruby Koans" instead of following my lesson.  :P

# 1. open 01_primatives.rb in a text editor.
# 2. run 01_primatives.rb in a terminal side-by-side to see it work.


# IGNORE BELOW!  This just runs the lessons by number.
def section_spacer(message)
  puts
  puts "-" * 50
  puts message
  puts "-" * 50
end

def line
  puts "-" * 50
end

require 'pry'

if ARGV[0]
  lesson_number = ARGV[0]
  # pad argument with leading zeros
  lesson_number = "%02d" % lesson_number
  file = Dir.glob("./#{lesson_number}_*.rb").first
  require file
else
  puts "Give me a lesson number.  For example: `ruby #{__FILE__} 1.`"
  exit 1
end