require 'booking'

describe Booking do
	let(:booking) { Booking.new }
	let(:booking2) { Booking.new }
	context 'initializes with booking ID, row, first seat and last seat' do
		it 'has booking ID' do
			expect(booking.id).to eq 1
		end

		it 'booking ID automatically increments' do
			expect(booking2.id).to eq 2
		end
	end
end