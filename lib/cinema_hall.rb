require_relative 'booking_checks'

class CinemaHall

	def initialize(hall_number)
		@number = hall_number
		@rows ||= []
		0.upto(99).each do | row_number|
			@rows << Row.new(row_number)
		end
	end

	attr_reader :number
	attr_reader :rows

	def book(booking_request, hall)
		if BookingChecks.valid_for_booking?(booking_request, hall)
			booking_request.seat_numbers.each do |seat_number|
				rows[booking_request.first_seat_row].seats[seat_number].available = false
			end
		else
			BookingChecks.rejected << booking_request
		end
	end
end