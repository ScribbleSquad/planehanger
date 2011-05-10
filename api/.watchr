#
# 'autotest' for riot
# install watchr
# $ sudo gem install watchr
# 
# Run With:
# $ watchr test.watchr
#

# --------------------------------------------------
# Helpers
# --------------------------------------------------
def run
  system( "rake test" )
end
# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch("test/*/*.rb") { run } 
watch("app/*/*.rb") { run } 
# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') do
  puts " --- Running all tests ---\n\n"
  run_all_tests
end
