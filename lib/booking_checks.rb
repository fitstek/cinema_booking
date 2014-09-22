# An independent module to enforce the booking rules
module BookingChecks
  def self.seats_on_the_same_row?(booking_request)
    booking_request.first_row == booking_request.last_row
  end

  def self.less_than_six_seats?(booking_request)
    booking_request.seat_numbers.count < Booking.max_number_of_seats
  end

  def self.seats_available?(booking_request, hall)
    booking_request.seat_numbers.all? do |seat_number|
      !hall.rows[booking_request.first_row].seats[seat_number].booked?
    end
  end

  def self.leaves_more_than_one_gap?(booking_request, hall)
    if seats(booking_request, hall).include?(booking_request.last_seat + 2)
      seats(booking_request, hall).include?(booking_request.last_seat + 1)
    elsif seats(booking_request, hall).include?(booking_request.first_seat - 2)
      seats(booking_request, hall).include?(booking_request.first_seat - 1)
    else
      corner_adjacent?(booking_request, hall)
    end
  end

  def self.corner_adjacent?(booking_request, hall)
    if booking_request.first_seat == Seat.first_seat_in_row + 1
      seats(booking_request, hall).include?(Seat.first_seat_in_row)
    elsif booking_request.last_seat == Seat.last_seat_in_row - 1
      seats(booking_request, hall).include?(Seat.last_seat_in_row)
    else
      true
    end
  end

  def self.valid_for_booking?(booking_request, hall)
    seats_on_the_same_row?(booking_request) &&
    less_than_six_seats?(booking_request) &&
    seats_available?(booking_request, hall) &&
    leaves_more_than_one_gap?(booking_request, hall)
  end

  def self.seats(booking_request, hall)
    seats = hall.rows[booking_request.first_row].seats.select(&:booked?)
    seats.map(&:number)
  end
end
