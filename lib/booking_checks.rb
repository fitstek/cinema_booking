module BookingChecks

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

		booked_seats_on_row = hall.rows[first_seat_row].seats.select do |seat|
			seat.booked?
		end

		booked_seat_number_on_row = booked_seats_on_row.map do |seat|
			seat.number
		end

    if booked_seat_number_on_row.nil?
      first_seat_number != 1 && last_seat_number != 48
    elsif booked_seat_number_on_row.include?(last_seat_number + 2)
      booked_seat_number_on_row.include?(last_seat_number + 1) ? true : false
    elsif booked_seat_number_on_row.include?(first_seat_number - 2)
      booked_seat_number_on_row.include?(first_seat_number - 1) ? true : false
    elsif first_seat_number == 1
    	booked_seat_number_on_row.include?(0)
    elsif last_seat_number == 48
    	booked_seat_number_on_row.include?(49)
    else
      true
    end
  end

	def self.valid_for_booking?(booking_request,hall)
		seats_on_the_same_row?(booking_request) && less_than_six_seats?(booking_request) && seats_available?(booking_request, hall) && leaves_more_than_one_gap?(booking_request, hall)
	end
end