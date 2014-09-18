# The row object a container for 50 seat objects
class Row
  def initialize(row_number)
    fail 'Please pick a row number between 0 and 99' if inexistent?(row_number)
    @seats ||= []
    @number = row_number
  end

  attr_reader :number

  def seats
    0.upto(49).each do | seat_number|
      @seats << Seat.new(number, seat_number)
    end
    @seats
  end

  def inexistent?(row_number)
    row_number < 0 || row_number > 99
  end
end
