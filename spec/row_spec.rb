require 'row'
require_relative '../spec_helper.rb'

describe Row do
  let(:row) { Row.new(number: 0) }
  it 'it initially knows it\'s number' do
    expect(row.number).to eq 0
  end

  it 'raises an error if the row number is greater than 99' do
    expect(-> { Row.new(number: 100) }).to raise_error(RuntimeError)
  end

  it 'raises an error if the row number is less than 0' do
    expect(-> { Row.new(number: -1) }).to raise_error(RuntimeError)
  end

  it 'contains 50 seat objects' do
    expect(row.seats.count).to eq 50
  end
end
