class Booking
	@@ids = 0
	
	def initialize(first_seat_row, first_seat_number, last_seat_row,last_seat_number)
		@@ids += 1
		@id = @@ids
		@first_seat = Seat.new(first_seat_row, first_seat_number)
		@last_seat = Seat.new(last_seat_row, last_seat_number)
	end

	attr_reader :id
	attr_reader :first_seat
	attr_reader :last_seat

end