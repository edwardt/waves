# Define WAVES_SRC when you want your app to use something
# other than the installed gem of Waves. Examples of common
# cases helpfully provided below
#
# The framework source used to generate this app
# WAVES_SRC = '/Users/matthew/dev/src/waves'
#
# Framework source lives in the same directory as this application
# WAVES_SRC = File.join(File.dirname(__FILE__), '..', '..', 'waves')

# Application is in a subdirectory of the framework
WAVES_SRC = File.join(File.dirname(__FILE__), '..', '..', '..')

# Waves source frozen at my_app/waves will always be used
FROZEN_WAVES = File.join(File.dirname(__FILE__), '..', 'waves')

if USE_FROZEN_WAVES = File.exist?(File.join(FROZEN_WAVES, "lib"))
  $:.unshift(File.join(FROZEN_WAVES, "lib"))
elsif USE_WAVES_SRC = defined?(WAVES_SRC)
  $:.unshift(File.join(WAVES_SRC, "lib"))
end

APP_ROOT = File.join(File.dirname(__FILE__), ".." )

begin
  require 'waves'
rescue LoadError => e
  raise e, "Can't find waves. Install the gem, freeze the source, or define WAVES_SRC in lib/framework.rb"
end