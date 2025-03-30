require 'debug'

def add_number(str)
  return 0 if str.nil? || str.empty?
  
  # Support different delimiters
  if str.start_with?("//")
    delimiter, str = str[2..].split("\n", 2)
    numbers = str.gsub(delimiter, ',').split(',').map(&:to_i)
  else
    numbers = str.gsub("\n", ',').split(',').map(&:to_i)
  end
  
  # Check for multiple negative numbers and raise an error
  negatives = numbers.select { |num| num < 0 }
  unless negatives.empty?
    raise "negative numbers not allowed: #{negatives.join(', ')}"
  end
  
  numbers.select { |n| n <= 1000 }.sum
rescue StandardError => e
  # Handle any other exceptions that may occur
  return e.message
end