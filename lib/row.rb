class Row

	def initialize(row_number)
		raise "Please pick a seat number between 0 and 99" if inexistent?(row_number)
		@number = row_number
	end

	attr_reader :number

	def inexistent?(row_number)
		row_number < 0 || row_number > 99
	end
end