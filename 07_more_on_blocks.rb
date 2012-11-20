# Blocks are really important.
# So we need to keep looking at them.

# In Perl, if you want to pass in options to a sub, you might shift off a bunch of options.
# Typically, you might only use the module GetOptions for command line options.
# But in Ruby, passing in options is really quite easy and it makes for some nice behavior.

section_spacer "07. More on blocks"

def get_web_service options={}
  # defaults
  options = {
    :url => "http://whatever.com",
    :path => '/api',
    :params => { :muffins => true }
  }.merge options
  puts options
end

get_web_service({:url => "foo.com"})

# That's fine for simple options.  But what if we want to give more control outside the method?
# Here's a trick people use.  Set up 
module App
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :url, :path, :params

    def initialize
      @url = 'http://whatever.com'
      @path = '/api'
      @params = { :muffins => true }
    end
  end
end

App.configure do |config|
  config.url = 'foo.com'
end

puts App.configuration.inspect
#<App::Configuration:0x007faf43086138 @url="foo.com", @path="/api", @params={:muffins=>true}>

App.configure do |config|
  config.path = '/weeeeee'
end
puts App.configuration.attributes
#<App::Configuration:0x007faad304e180 @url="foo.com", @path="/weeeeee", @params={:muffins=>true}>

# Yes, it's confusing.  But look at the result!  App is easy to use and understand and could
# easily be turned into a Singleton for use in a web application.


# A lot of Gems, Libraries and Ruby DSLs (domain specific languages) use this block technique for great justice.  Most of the time
# you'll be using this technique, not writing it.  For example, here's how you use Faraday, an HTTP client.
require 'faraday'
require 'pp'
require 'json'
conn = Faraday.new(:url => 'http://us.battle.net') do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end
response = conn.get do |request|
  request.url '/api/wow/data/character/races'
  request.options[:locale] = "fr_FR"
end
json_response = JSON.parse response.body
pp json_response

