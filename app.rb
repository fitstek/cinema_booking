require_relative 'lib/booking'
require_relative 'lib/booking_checks'
require_relative 'lib/cinema_hall'
require_relative 'lib/row'
require_relative 'lib/seat'


@hall = CinemaHall.new(1)

def hall
  @hall 
end

def input_from
  puts "Please put the path of the file to be processed"
  file_path = gets.chomp
  File.open(file_path, "r").each_line do | booking_request|
    params = booking_request.split(/\D/).drop(1)
    first_row = params[1].to_i
    first_seat = params[2].to_i
    last_row = params[3].to_i
    last_seat = params[4].to_i
    booking = Booking.new(first_row, first_seat, last_row, last_seat)
    hall.book(booking, hall)
  end
    puts "Total number of bookings rejected: #{@hall.rejected.count}"
    puts "IF you want see the rejected bookings type: hall.rejected"
end

input_from