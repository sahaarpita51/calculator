def add_number(str)
  return 0 if str.nil? || str.empty?

  return str.split(',').map(&:to_i).sum
end