# main.rb

# Running the RSpec test file
result = system('rspec spec  --format documentation')

# Outputting the result of the test run
if result
  puts 'Tests ran successfully'
else
  puts 'Tests failed'
end
