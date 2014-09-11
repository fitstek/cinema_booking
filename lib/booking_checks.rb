module BookingChecks

	def seats_on_the_same_row?(booking_request)
		booking_request.first_seat.row == booking_request.last_seat.row
	end

	def less_than_six_seats?(booking_request)
		booking_request.last_seat.number - booking_request.first_seat.number < 6
	end

end