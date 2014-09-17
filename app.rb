require_relative 'lib/booking'
require_relative 'lib/booking_checks'
require_relative 'lib/cinema_hall'
require_relative 'lib/row'
require_relative 'lib/seat'


@hall = CinemaHall.new(1)


def input_from(file_path)
  File.open(file_path, "r").each_line do | booking_request|
    params = booking_request.split(/\D/).drop(1)
    first_row = params[1].to_i
    first_seat = params[2].to_i
    last_row = params[3].to_i
    last_seat = params[4].to_i
    b = Booking.new(first_row, first_seat, last_row, last_seat)
    @hall.book(b, @hall)
  end
end