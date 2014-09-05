require 'seat'

describe Seat do
	let(:seat) { Seat.new }
	it 'is available initially' do
		expect(seat).not_to be_booked
	end
end