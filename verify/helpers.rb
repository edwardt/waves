%w( rubygems bacon ).each { |f| require f }

Bacon.extend Bacon::TestUnitOutput
Bacon.summary_on_exit

# protect TextMate from itself.

# Prepend the framework lib to the loadpath
$:.unshift( File.join(File.dirname(__FILE__), "..", "lib") )
require 'waves'

# define basic app for use in testing
# before methods may add to it using helper methods
module Test ; include Waves::Foundations::Simple ; end
module Test ; include Waves::Layers::SimpleErrors ; end
Waves << Test
Waves::Console.load( :mode => :development )

module Kernel
  private
  def specification(name, &block)  Bacon::Context.new(name, &block) end
end

Bacon::Context.instance_eval do
  include Waves::Helpers::Test 
  alias_method :specify, :it
end