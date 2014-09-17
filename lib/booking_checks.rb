module BookingChecks

	@rejected = []

	def self.seats_on_the_same_row?(booking_request)
		booking_request.first_seat_row == booking_request.last_seat_row
	end

	def self.less_than_six_seats?(booking_request)
		booking_request.seat_numbers.count < 6
	end

	def self.seats_available?(booking_request, hall)
		booking_request.seat_numbers.all? { |seat_number| hall.rows[booking_request.first_seat_row].seats[seat_number].available? }
	end

	def self.leaves_more_than_one_gap?(booking_request, hall)
		first_seat_row = booking_request.first_seat_row
		last_seat_row = booking_request.last_seat_row
		first_seat_number = booking_request.first_seat
		last_seat_number = booking_request.last_seat

		if hall.rows[first_seat_row].seats.all? {|seat| seat.available?}
			first_seat_number != 1 && last_seat_number != 48
		elsif first_seat_number != 1 && hall.rows[first_seat_row].seats[(first_seat_number - 2)].booked?
			hall.rows[first_seat_row].seats[(first_seat_number - 1)].available? ? false : true
		elsif last_seat_number != 48 && hall.rows[last_seat_row].seats[(last_seat_number + 2)].booked? 
			hall.rows[last_seat_row].seats[(last_seat_number + 1)].available? ? false : true
		elsif first_seat_number == 1
			hall.rows[first_seat_row].seats[0].available? ? false : true
		elsif last_seat_number == 48
			hall.rows[last_seat_row].seats[49].available? ? false : true
		else
			true
		end
	end

	def self.rejected
		@rejected
	end

	def self.valid_for_booking?(booking_request,hall )
		seats_on_the_same_row?(booking_request) && less_than_six_seats?(booking_request) && seats_available?(booking_request, hall) && leaves_more_than_one_gap?(booking_request, hall)
	end
end