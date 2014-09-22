# This gives the attributes of a single hall in the cinema
class CinemaHall
  def initialize(options = {})
    @rejected = []
    @number = options.fetch(:hall_number)
    @rows ||= []
  end

  attr_reader :number
  attr_reader :rejected

  def rows
    0.upto(99).each do | row_number|
      @rows << Row.new(number: row_number)
    end
    @rows
  end

  def seat_in(options = {})
    rows[options.fetch(:row)].seats[options.fetch(:seat)]
  end

  def book(booking_request, hall)
    if BookingChecks.valid_for_booking?(booking_request, hall)
      booking_request.seat_numbers.each do |seat_number|
        seat_in(row: booking_request.first_row, seat: seat_number).available = false
      end
    else
      rejected << booking_request
    end
  end
end
