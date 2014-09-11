module BookingChecks

	def seats_on_the_same_row?(booking_request)
		booking_request.first_seat.row == booking_request.last_seat.row
	end

	def less_than_six_seats?(booking_request)
		booking_request.seats.count < 6
	end

	def seats_available?(booking_request)
		booking_request.seats.all? { |seat| seat.available? }
	end
end