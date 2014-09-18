# This class defines attributes seen in one booking request
class Booking
  @id = 0

  attr_reader :id, :first_seat, :last_seat, :last_seat_row, :first_seat_row

  class << self
    attr_accessor :id
  end

  def initialize(first_seat_row, first_seat, last_seat_row, last_seat)
    self.class.id += 1
    @first_seat_row = first_seat_row
    @first_seat = first_seat
    @last_seat_row = last_seat_row
    @last_seat = last_seat
  end

  def seat_numbers
    @seat_numbers = []
    first_seat.upto(last_seat).each do |seat_number|
      @seat_numbers << seat_number
    end
    @seat_numbers
  end
end
