require 'seat'
require 'spec_helper'

describe Seat do
  let(:seat) { Seat.new(0, 0) }
  it 'is available initially' do
    expect(seat).to be_available
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
    expect(-> { Seat.new(0, 50) }).to raise_error(RuntimeError)
  end

  it 'raises an error if the seat number is less than 0' do
    expect(-> { Seat.new(0, -1) }).to raise_error(RuntimeError)
  end
end
