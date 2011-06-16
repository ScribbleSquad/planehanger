$: << File.expand_path(File.dirname(__FILE__)) + '../../app/' 
$: << File.expand_path(File.dirname(__FILE__)) + '../../config/'
$: << File.expand_path(File.dirname(__FILE__)) + '../../config/environments'

require 'rubygems'
require "sinatra" 
require 'rack-flash'
require 'bundler'
require 'active_resource'

# ================
# = environments =
# ================
require "development"
require "production"
require "staging"

# ===============
# = application =
# ===============       
require 'settings'
require 'helpers'
require 'resources'
require 'model' 
require 'routes'


# ================
# = riot testing =
# ================ 
require "riot"  
require 'riot/rr'
                 
ENV["RACK_ENV"] ||= "test"

class GrowlReporter < Riot::StoryReporter
       def results(time_taken);          
         
         super
         
         values = [passes, failures, errors, ("%0.6f" % time_taken)]
         result =  "\n%d passes, %d failures, %d errors in %s seconds" % values 
         system "growlnotify -m \" #{result}\"" 
         
       end
end


Riot::reporter = GrowlReporter

class GrowlReporter < Riot::StoryReporter
       def results(time_taken);          
         
         super
         
         values = [passes, failures, errors, ("%0.6f" % time_taken)]
         result =  "\n%d passes, %d failures, %d errors in %s seconds" % values 
         system "growlnotify -m \" #{result}\"" 
         
       end
end


Riot::reporter = GrowlReporter