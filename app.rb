require_relative 'lib/booking'
require_relative 'lib/booking_checks'
require_relative 'lib/cinema_hall'
require_relative 'lib/row'
require_relative 'lib/seat'

@hall = CinemaHall.new(hall_number: 1)

def hall
  @hall
end

def user_input
  puts 'Please put the path of the file to be processed'
  gets.chomp
end

def output_message
  puts "Total number of bookings rejected: #{hall.rejected.count}"
  puts 'IF you want see the rejected bookings type: hall.rejected'
end

def book_from(user_input)
  read_file_from(user_input).each_line do | booking_request|
    booking = Booking.new(get_hash_from(booking_request))
    hall.book(booking, hall)
  end
end

def read_file_from(file_path)
  File.open(file_path, 'r')
end

def get_hash_from(booking_request)
  params = booking_request.split(/\D/).drop(1)
  hash = {}
  hash[:first_row] = params[1].to_i
  hash[:first_seat] = params[2].to_i
  hash[:last_row] = params[3].to_i
  hash[:last_seat] = params[4].to_i
  hash
end

book_from(user_input)
output_message
