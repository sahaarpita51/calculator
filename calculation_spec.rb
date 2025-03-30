# calculation_spec.rb
require 'rspec'
require_relative 'calculation'

RSpec.describe '#add_number' do
  it 'returns 0 for nil input' do
    expect(add_number(nil)).to eq(0)
  end

  it 'returns 0 for an empty string' do
    expect(add_number('')).to eq(0)
  end

  it 'returns the number itself for a single number string' do
    expect(add_number('5')).to eq(5)
  end

  it 'returns the sum of numbers for a comma-separated string' do
    expect(add_number('1,2,3,4,5')).to eq(15)
  end

  it 'ignores invalid characters and sums valid numbers' do
    expect(add_number('11,a,33')).to eq(44)
  end

  it 'raises an error for a single negative number' do
    expect(add_number('-5')).to eq('negative numbers not allowed: -5')
  end

  it 'raises an error for multiple negative numbers' do
    expect(add_number('-1,-2,-3')).to eq('negative numbers not allowed: -1, -2, -3')
  end

  it 'returns 0 for a string with only non-numeric characters' do
    expect(add_number('a,b,c')).to eq(0)
  end

  it 'handles a mix of positive and negative numbers, raising an error for negatives' do
    expect(add_number('1,-2,3,-4')).to eq('negative numbers not allowed: -2, -4')
  end

  it 'supports custom single-character delimiters' do
    expect(add_number("//;\n1;2;3")).to eq(6)
  end

  it 'ignores numbers greater than 1000' do
    expect(add_number("2,1022,6")).to eq(8)
  end

  it 'handles custom delimiters with numbers greater than 1000' do
    expect(add_number("//;\n2;1001;6")).to eq(8)
  end

  it 'handles newline characters as delimiters' do
    expect(add_number("1\n2,3")).to eq(6)
  end

  it 'raises an error for invalid custom delimiter format' do
    expect(add_number("//;\n1;2;3;")).to eq(6)
  end
end