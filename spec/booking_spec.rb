require 'booking'

describe Booking do
	let(:booking) { Booking.new }
	context 'initializes with booking ID, row, first seat and last seat' do
		it 'has booking ID' do
			expect(booking.id).to eq 1
		end

		it 'booking ID automatically increments' do
			booking2 = Booking.new
			booking3 = Booking.new
			expect(booking3.id).to eq 3
		end
	end
end