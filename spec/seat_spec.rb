require 'seat'

describe Seat do
	# let(:seat) { Seat.new }
	it 'is available initially' do
		seat = Seat.new(0,0)
		expect(seat).not_to be_booked
	end
	context 'seat and row numbers' do
		it 'knows its seat number when created' do
			seat = Seat.new(0,0)
			expect(seat.number).to eq 0
		end
		it 'knows its row number when created' do
			seat = Seat.new(0,0)
			expect(seat.row).to eq 0
		end
	end
end