class Seat
	def initialize(row_number, seat_number)
		@booked = false
		@row = row_number
		@number = seat_number
	end

	attr_reader :row
	attr_reader :number

	def booked?
		@booked
	end
end