require 'booking'
require_relative '../spec_helper.rb'

describe Booking do
  let(:booking) do
    Booking.new(
    first_row: 0,
    first_seat: 1,
    last_row: 0,
    last_seat: 1)
  end

  context 'initializes with booking ID, row, first seat and last seat' do

    it 'knows the first seat number' do
      expect(booking.first_seat).to eq 1
    end

    it 'knows the last seat number' do
      expect(booking.last_seat).to eq 1
    end

    it 'knows the row of the first seat number' do
      expect(booking.first_row).to eq 0
    end

    it 'knows the row of the first seat number' do
      expect(booking.last_row).to eq 0
    end
  end
end
