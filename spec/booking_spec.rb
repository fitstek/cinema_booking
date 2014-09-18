require 'booking'

describe Booking do
  let(:booking) { Booking.new(0, 1, 0, 1) }
  let(:booking2) { Booking.new(0, 1, 0, 3) }

  context 'initializes with booking ID, row, first seat and last seat' do

    it 'takes the first and last positions of bookings(row,seat)' do
      expect(booking.first_seat).to eq 1
    end

    it 'takes the first and last positions of bookings(row,seat)' do
      expect(booking2.last_seat).to eq 3
    end
  end
end
