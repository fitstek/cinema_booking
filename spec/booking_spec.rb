require 'booking'
require 'spec_helper'

describe Booking do
  let(:booking) { Booking.new(0, 1, 0, 1) }

  context 'initializes with booking ID, row, first seat and last seat' do

    it 'knows the first seat number' do
      expect(booking.first_seat).to eq 1
    end

    it 'knows the last seat number' do
      expect(booking.last_seat).to eq 1
    end

    it 'knows the row of the first seat number' do
      expect(booking.first_seat_row).to eq 0
    end

    it 'knows the row of the first seat number' do
      expect(booking.last_seat_row).to eq 0
    end
  end
end
