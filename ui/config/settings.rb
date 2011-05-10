require 'rubygems'
require "sinatra" 
require 'rack-flash'

# ===================
# = Global Settings =
# ===================                               
enable :sessions 


# =================
# = Rack Settings =
# =================
use Rack::Session::Cookie 
use Rack::Flash, :accessorize => [:notice, :error]
           

# =======================
# = views and templates =
# ======================= 
set :views, "./app/views"            

# ============
# = Database =
# ============
set :connections , @connections = {"production" => ENV['DATABASE_URL'],"staging" => ENV['DATABASE_URL'],"test" => "sqlite://tests/cargo.db","development" => "sqlite://db/cargo.db"}                                       
