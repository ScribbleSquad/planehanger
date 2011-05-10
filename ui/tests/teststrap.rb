# ================
# = riot testing =
# ================ 
require "rubygems"
require "riot"
                 
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