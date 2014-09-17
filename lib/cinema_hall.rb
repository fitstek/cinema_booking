require_relative 'booking_checks'

class CinemaHall

	def initialize(hall_number)
    @rejected = []
		@number = hall_number
		@rows ||= []
		0.upto(99).each do | row_number|
			@rows << Row.new(row_number)
		end
	end

	attr_reader :number
	attr_reader :rows

  def populate_hall
    
  end

	def edge?(seat)
		seat.number == 0 || seat.number == 49
	end

	def next(seat)
		if seat.number == 0
			return self.rows[seat.row].seats[seat.number + 1]
		elsif seat.number == 49
			return nil
    else 
      self.rows[seat.row].seats[seat.number + 1]
		end
	end

	def previous(seat)
		if seat.number == 49
			return self.rows[seat.row].seats[seat.number - 1]
		elsif seat.number == 0
			return nil
    else
      self.rows[seat.row].seats[seat.number - 1] 
		end
	end

	def book(booking_request, hall)
		if BookingChecks.valid_for_booking?(booking_request, hall)
			booking_request.seat_numbers.each do |seat_number|
				rows[booking_request.first_seat_row].seats[seat_number].available = false
			end
		else
			rejected << booking_request
		end
	end

  def rejected
    @rejected
  end
end