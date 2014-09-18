require 'row'
require 'spec_helper'

describe Row do
  it 'it initially knows it\'s number' do
    row = Row.new(0)
    expect(row.number).to eq 0
  end

  it 'raises an error if the row number is greater than 99' do
    expect(lambda { Row.new(100) }).to raise_error(RuntimeError)
  end

  it 'raises an error if the row number is less than 0' do
    expect(lambda { Row.new(-1) }).to raise_error(RuntimeError)
  end

  it 'contains 50 seat objects' do
    row = Row.new(0)
    expect(row.seats.count).to eq 50
  end
end
