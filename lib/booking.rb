# This class defines attributes seen in one booking request
class Booking
  @id = 0

  class << self
    attr_accessor :id
  end

  attr_reader :id, :first_seat, :last_seat, :last_row, :first_row

  def self.max_number_of_seats
    5
  end

  def initialize(options = {})
    self.class.id += 1
    @first_row = options.fetch(:first_row)
    @first_seat = options.fetch(:first_seat)
    @last_row = options.fetch(:last_row)
    @last_seat = options.fetch(:last_seat)
  end

  def seat_numbers
    @seat_numbers = []
    first_seat.upto(last_seat).each do |seat_number|
      @seat_numbers << seat_number
    end
    @seat_numbers
  end
end
