# Describes the attributes of a single seat
class Seat
  attr_reader :row, :number
  attr_accessor :available

  def initialize(options = {})
    fail 'Please pick a seat between 0 and 49' if inexistent_seat?(options.fetch(:number))
    fail 'Please pick a row between 0 and 99' if inexistent_row?(options.fetch(:row))
    @available = true
    @row = options.fetch(:row)
    @number = options.fetch(:number)
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
