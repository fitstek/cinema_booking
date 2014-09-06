require 'cinema_hall'

describe CinemaHall do
	let(:hall) { CinemaHall.new(1) }
	it 'initializes with a hall number' do
		expect(hall.number).to eq 1
	end

	it 'contains 100 row objects' do
		expect(hall.rows.count).to eq 100
	end
end