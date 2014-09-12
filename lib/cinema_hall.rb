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

	def book(booking_request, hall)
		if valid?(booking_request, hall)
			booking_request.seat_numbers.each do |seat_number|
				rows[booking_request.first_seat_row].seats[seat_number].available = false
			end
		end
	end

	def valid?(booking_request, hall)
		seats_on_the_same_row?(booking_request) && less_than_six_seats?(booking_request) && seats_available?(booking_request, hall) && leaves_more_than_one_gap?(booking_request, hall)
	end
end