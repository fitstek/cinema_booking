require 'booking_checks'

class Check; include BookingChecks; end

describe BookingChecks do
	let(:check) {Check.new}
	let(:booking) {Booking.new(1,0,46,0,48)}
	let(:booking1) {Booking.new(1,0,1,0,4)}
	let(:booking2) {Booking.new(1,0,3,0,6)}
	let(:booking3) {Booking.new(1,0,3,0,4)}
	let(:booking4) {Booking.new(1,0,3,1,4)}
	let(:booking5) {Booking.new(1,0,3,0,9)}	
	
	it 'gives true when bookings are on the same row' do
		expect(check.seats_on_the_same_row?(booking3)).to eq true
	end

	it 'gives false when bookings are on the same row' do
		expect(check.seats_on_the_same_row?(booking4)).to eq false
	end

	it 'gives true when booking contains less than 6 seats'do
		expect(check.less_than_six_seats?(booking3)).to eq true
	end

	it 'gives false when booking contains more than 6 seats'do
		expect(check.less_than_six_seats?(booking5)).to eq false
	end

	it 'gives true if all seats are available' do
		expect(check.seats_available?(booking3)).to eq true
	end

	it 'gives false if all seats are not available' do
		booking3.hall.rows[0].seats[3].available = false
		expect(check.seats_available?(booking3)).to eq false
	end

	it 'gives false if there is one gap between seats' do
		booking3.hall.rows[0].seats[1].available = false
		expect(check.leaves_more_than_one_gap?(booking3)).to eq false
	end

	it 'gives true if there is more than one gap between seats' do
		expect(check.leaves_more_than_one_gap?(booking3)).to eq true
	end

	it 'gives false if the seat has one gap from the first seat of the row' do
		expect(check.leaves_more_than_one_gap?(booking1)).to eq false
	end

	it 'gives false if the seat has one gap from the last seat of the row' do
		expect(check.leaves_more_than_one_gap?(booking)).to eq false
	end

	it 'gives true if the seat has no gap from the last seat of the row' do
		booking.hall.rows[0].seats[49].available = false
		expect(check.leaves_more_than_one_gap?(booking)).to eq true
	end

	it 'gives true if the seat has no gap from the first seat of the row' do
		booking1.hall.rows[0].seats[0].available = false
		expect(check.leaves_more_than_one_gap?(booking1)).to eq true
	end

end