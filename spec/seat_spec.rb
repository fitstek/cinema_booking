require 'seat'
require_relative '../spec_helper.rb'

describe Seat do
  let(:seat) { Seat.new(row: 0, number: 0) }
  it 'is available initially' do
    expect(seat).not_to be_booked
  end

  it 'can change states to booked' do
    seat.available = false
    expect(seat).to be_booked
  end

  it 'knows its seat number when created' do
    expect(seat.number).to eq 0
  end

  it 'knows its row number when created' do
    expect(seat.row).to eq 0
  end

  it 'raises an error if the seat number is greater than 49' do
    expect(-> { Seat.new(row: 0, number: 50) }).to raise_error(RuntimeError)
  end

  it 'raises an error if the seat number is less than 0' do
    expect(-> { Seat.new(row: 0, number: -1) }).to raise_error(RuntimeError)
  end
end
