# This class defines attributes seen in one booking request
class Booking
  @@ids = 0

  def initialize(first_seat_row, first_seat_number, last_seat_row, last_seat_number)
    @@ids += 1
    @seat_numbers = []
    @id = @@ids
    @first_seat = first_seat_number
    @last_seat = last_seat_number
    @first_seat_row = first_seat_row
    @last_seat_row = last_seat_row
  end

  attr_reader :id
  attr_reader :first_seat, :last_seat, :last_seat_row, :first_seat_row

  def seat_numbers
    first_seat.upto(last_seat).each do |seat_number|
      @seat_numbers << seat_number
    end
    @seat_numbers
  end
end
