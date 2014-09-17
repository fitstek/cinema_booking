class Booking
	@@ids = 0
	
	def initialize(first_seat_row, first_seat_number, last_seat_row,last_seat_number)
		@@ids += 1
		@seat_numbers ||= []
		@id = @@ids
		@first_seat = first_seat_number
		@last_seat = last_seat_number
		@first_seat_row = first_seat_row
		@last_seat_row = last_seat_row
		if first_seat_row == last_seat_row
			first_seat_number.upto(last_seat_number).each do |seat_number|
				@seat_numbers << seat_number
			end
		end
	end


	attr_reader :id
	attr_reader :first_seat
	attr_reader :last_seat
	attr_reader :seat_numbers
	attr_reader :last_seat_row
	attr_reader :first_seat_row

end

