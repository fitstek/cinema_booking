# This gives the attributes of a single hall in the cinema
class CinemaHall
  def initialize(hall_number)
    @rejected = []
    @number = hall_number
    @rows ||= []
  end

  attr_reader :number
  attr_reader :rejected

  def rows
    0.upto(99).each do | row_number|
      @rows << Row.new(row_number)
    end
    @rows
  end

  def seat_in(row_number, seat_number)
    rows[row_number].seats[seat_number]
  end

  def book(booking_request, hall)
    if BookingChecks.valid_for_booking?(booking_request, hall)
      booking_request.seat_numbers.each do |seat_number|
        seat_in(booking_request.first_seat_row, seat_number).available = false
      end
    else
      rejected << booking_request
    end
  end
end
