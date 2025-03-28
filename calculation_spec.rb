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
    expect(add_number('1,a,3')).to eq(4)
  end

  it 'raises an error for a single negative number' do
    expect(add_number('-5')).to eq('negative numbers not allowed: -5')
  end

  it 'raises an error for multiple negative numbers' do
    expect(add_number('-1,-2,-3')).to eq('negative numbers not allowed: -1, -2, -3')
  end

  it 'returns the sum ignoring non-numeric characters' do
    expect(add_number('1,2,b,3')).to eq(6)
  end

  it 'returns 0 for a string with only non-numeric characters' do
    expect(add_number('a,b,c')).to eq(0)
  end

  it 'handles a mix of positive and negative numbers, raising an error for negatives' do
    expect(add_number('1,-2,3,-4')).to eq('negative numbers not allowed: -2, -4')
  end
end