class CinemaHall

	def initialize(hall_number)
		@number = hall_number
		@rows ||= []
		0.upto(99).each do | row_number|
			@rows << Row.new(row_number)
		end
		@rows
	end

	attr_reader :number
	attr_reader :rows
end