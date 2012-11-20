section_spacer "10. Tools"

# CPAN is a shell.  You fire it up and it installs modules and libraries.
# Gem install (from Rubygems) is not a shell.  You run commands and it does the same thing.

# CPAN should not get in a dependency loop but it does.
# Rubygems should not get in a dependency loop and usually does.
# Both are crippled by an out of date OS.  So don't run RedHat 1.0.  :P

# Typically Perl on the web is run through mod_perl or CGI.
# There's no CGI in Ruby-land.  But there are a ton of webservers.
# Ruby comes with Webbrick (a web server).  It won't run in Apache.  It runs by itself.
# There's a project called Passenger which also goes by the name of mod_rails.
# Other webservers:
# - Thin      (Evented, fast, nice, an easy replacement)
# - Puma      (I've never used this, hot new one on the scene)
# - Unicorn   (Typically run inside of Nginx, I've never used)
# - Pow       (gives you a .dev localhost DNS domain name)
# - You get Mongrel with Rails by default
# etc etc etc

# In a polyglot shop, I usually just pick Passenger.  You don't want to have to 
# start another process.


# You can put a shebang at the top of the file like Perl and make it chmod u+x.
# You can pipe in STDIN and do your perl -e 'tricks' (although I think Perl does this better)

# Pry is an interactive REPL but more than that.  It's the debugger.
# In Perl, you usually Data::Dumper or print.  Pry gets rid of all that
# temp code.  But it's not quite as cool (Pry crashes sometimes) as Java's debugger but in some cases way more awesome (interactive).
