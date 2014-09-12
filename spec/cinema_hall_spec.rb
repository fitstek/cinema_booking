require 'cinema_hall'

describe CinemaHall do
	let(:hall) { CinemaHall.new(1) }
	let(:booking) { Booking.new(0,1,0,1) }
	it 'initializes with a hall number' do
		expect(hall.number).to eq 1
	end

	it 'contains 100 row objects' do
		expect(hall.rows.count).to eq 100
	end

	it 'books seats' do
		hall.book(booking)
		expect(hall.rows[0].seats[1]).to be_booked
	end

end