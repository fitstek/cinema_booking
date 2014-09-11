require 'booking'

describe Booking do
	let(:booking) { Booking.new(0,1,0,1) }
	let(:booking2) { Booking.new(0,1,0,3) }
	context 'initializes with booking ID, row, first seat and last seat' do
		# it 'has booking ID' do
		# 	expect(booking.id).to eq 1
		# end

		# it 'booking ID automatically increments' do
		# 	expect(booking2.id).to eq 2
		# end

		it 'takes the first and last positions of bookings(row,seat)' do
			expect(booking.first_seat.number).to eq 1
		end

		it 'takes the first and last positions of bookings(row,seat)' do
			expect(booking2.last_seat.number).to eq 3
		end
	end
end