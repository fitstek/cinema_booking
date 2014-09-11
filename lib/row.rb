class Row

	def initialize(row_number)
		@seats ||= []
		raise "Please pick a row number between 0 and 99" if inexistent?(row_number)
		@number = row_number
		0.upto(49).each do | seat_number|
			@seats << Seat.new(row_number, seat_number)
		end
	end

	attr_reader :number
	attr_reader :seats
	
	def inexistent?(row_number)
		row_number < 0 || row_number > 99
	end
end