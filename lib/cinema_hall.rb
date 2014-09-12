require_relative 'booking_checks'

class CinemaHall

	include BookingChecks

	def initialize(hall_number)
		@number = hall_number
		@rows ||= []
		0.upto(99).each do | row_number|
			@rows << Row.new(row_number)
		end
	end

	attr_reader :number
	attr_reader :rows

	def book(booking_request)
		booking_request.seat_numbers.each do |seat_number|
			rows[booking_request.first_seat_row].seats[seat_number].available = false
		end
	end
end