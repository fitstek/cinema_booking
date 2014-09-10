class Seat
	def initialize(row_number, seat_number)
		raise "Please pick a seat number between 0 and 49" if inexistent?(seat_number)
		raise "Please pick a row number between 0 and 99" unless 0.upto(99).include?(row_number)
		@booked = false
		@row = row_number
		@number = seat_number
	end

	attr_reader :row
	attr_reader :number
	attr_accessor :booked

	def booked?
		@booked
	end

	def inexistent?(seat_number)
		seat_number < 0 || seat_number > 49
	end
end