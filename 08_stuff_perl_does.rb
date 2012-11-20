section_spacer "08. Stuff Perl Does"

# Perl has C-style for loops.  Ruby doesn't at all.
# for ($i=0; $i <= 3; $i++) {
#   print "$i\n";
# }

# the best way to do this in Ruby is like this:
0.upto(3) do |i|
  puts i
end


# Perl can pass by reference.  Ruby can't.
puts "Perl can do stuff like foo(\@a);"
puts "Ruby cannot."


puts "Perl has more regex modifiers."
puts "This in Perl would be s/mi/ma/g;"
s = "do re mi mi mi"
puts s.gsub! /mi/, "ma"

line
puts "Perl has 114,614 modules in CPAN on October 31 2012 since 1995."
puts "Ruby has 46,308 gems in Rubygems on October 31 2012 since July 2009."

line
puts "It is much more simple to write a mod_perl single page than write a Rails app."

line
puts "Perl has Perl libraries.  You know their names.  You might miss their names."
puts "But I assure you that there is a library in Ruby that does the same thing."

line
# Ruby has =~ just like Perl for matching but doesn't have s/// for replacement.
# Has sub() and gsub()
puts "Perl does one-liners better:"
puts "Perl:"
puts "echo foo | perl -pe 's/foo/bar/;'"
puts "Ruby:"
puts 'echo foo | ruby -pe "gsub /foo/, \'bar\'"'

line
puts "Matching:"
puts "Perl:"
puts 'echo -e "foo123\nbar456" | ruby -pe "next unless $_ =~ /^foo/"'
puts "Ruby:"
puts 'echo -e "foo123\nbar456" | perl -ne \'print if m/^foo/;\''