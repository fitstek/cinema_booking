# The row object a container for 50 seat objects
class Row
  attr_reader :number

  def self.first_row_in_hall
    0
  end

  def self.last_row_in_hall
    99
  end

  def initialize(options = {})
    fail 'Please pick a row number between 0 and 99' if inexistent?(options.fetch(:number))
    @seats ||= []
    @number = options.fetch(:number)
  end

  def seats
    (Seat.first_seat_in_row).upto(Seat.last_seat_in_row).each do | seat_number|
      @seats << Seat.new(row: number, number: seat_number)
    end
    @seats
  end

  def inexistent?(row_number)
    row_number < Row.first_row_in_hall || row_number > Row.last_row_in_hall
  end
end
