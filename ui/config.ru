$: << File.expand_path(File.dirname(__FILE__)) + '/app'
$: << File.expand_path(File.dirname(__FILE__)) + '/config' 
$: << File.expand_path(File.dirname(__FILE__)) + '/config/environments'

require 'rubygems'
require "sinatra" 
require 'rack-flash'
require 'bundler'

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

               
# ===========
# = Bundler =
# ===========
Bundler.require

# ========
# = Main =
# ========
run Sinatra::Application