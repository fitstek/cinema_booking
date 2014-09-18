# Describes the attributes of a single seat
class Seat
  attr_reader :row, :number
  attr_accessor :available

  def initialize(row_number, seat_number)
    fail 'Please pick a seat between 0 and 49' if inexistent_seat?(seat_number)
    fail 'Please pick a row between 0 and 99' if inexistent_row?(row_number)
    @available = true
    @row = row_number
    @number = seat_number
  end

  def available?
    @available
  end

  def booked?
    !@available
  end

  def inexistent_seat?(number)
    number < 0 || number > 49
  end

  def inexistent_row?(number)
    number < 0 || number > 99
  end
end
