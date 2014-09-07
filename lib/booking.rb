class Booking
		@@ids = 0
	def initialize
		@@ids += 1
		@id = @@ids
	end

	attr_reader :id

end