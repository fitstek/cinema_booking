class Booking
	@@ids = 0
	
	def initialize(hall_number, first_seat_row, first_seat_number, last_seat_row,last_seat_number)
		@hall = CinemaHall.new(hall_number)
		@@ids += 1
		@seats ||= []
		@id = @@ids
		@first_seat = hall.rows[first_seat_row].seats[first_seat_number]
		@last_seat = hall.rows[last_seat_row].seats[last_seat_number]
		first_seat_number.upto(last_seat_number).each do |seat_number|
			@seats << hall.rows[first_seat_row].seats[seat_number]
		end
		@seats
	end

	attr_reader :hall
	attr_reader :id
	attr_reader :first_seat
	attr_reader :last_seat
	attr_reader :seats

end