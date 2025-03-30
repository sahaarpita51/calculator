require 'debug'

def add_number(str)
  return 0 if str.nil? || str.empty?
  
  numbers = fetch_integer_numbers(str)
  raise_negative_numbers(numbers)

  # Filter out numbers greater than 1000 and sum the rest
  numbers.select { |n| n <= 1000 }.sum
rescue StandardError => e
  # Handle any other exceptions that may occur
  return e.message
end

private

def fetch_integer_numbers(str)
  # Support different delimiters
  if str.start_with?("//")
    delimiter, str = str[2..].split("\n", 2)
    delimiter = delimiter[1..-2] if delimiter.start_with?("[") && delimiter.end_with?("]")
    str.gsub(delimiter, ',').split(',').map(&:to_i)
  else
    str.gsub("\n", ',').split(',').map(&:to_i)
  end  
end

def raise_negative_numbers(numbers)
  # Check for multiple negative numbers and raise an error
  negatives = numbers.select { |num| num < 0 }
  unless negatives.empty?
    raise "negative numbers not allowed: #{negatives.join(', ')}"
  end
end