require 'debug'

def add_number(str)
  return 0 if str.nil? || str.empty?
  
  # convert string to integer
  numbers = str.split(',').map(&:to_i)
  
  # Check for multiple negative numbers and raise an error
  negatives = numbers.select { |num| num < 0 }
  unless negatives.empty?
    raise "negative numbers not allowed: #{negatives.join(', ')}"
  end
  
  numbers.sum
rescue StandardError => e
  # Handle any other exceptions that may occur
  return e.message
end