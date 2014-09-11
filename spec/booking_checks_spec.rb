require 'booking_checks'

class Check; include BookingChecks; end

describe BookingChecks do
	let(:check) {Check.new}
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
end