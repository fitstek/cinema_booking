require 'booking_checks'
require_relative '../spec_helper.rb'

describe BookingChecks do
  let(:hall) { CinemaHall.new(hall_number: 1) }
  let(:booking) do
    Booking.new(
    first_row: 0,
    first_seat: 46,
    last_row: 0,
    last_seat: 48)
  end
  let(:booking1) do
    Booking.new(
    first_row: 0,
    first_seat: 1,
    last_row: 0,
    last_seat: 4)
  end
  let(:booking2) do
    Booking.new(
    first_row: 0,
    first_seat: 3,
    last_row: 0,
    last_seat: 6)
  end
  let(:booking3) do
    Booking.new(
    first_row: 0,
    first_seat: 3,
    last_row: 0,
    last_seat: 4)
  end
  let(:booking4) do
    Booking.new(
    first_row: 0,
    first_seat: 3,
    last_row: 1,
    last_seat: 4)
  end
  let(:booking5) do
    Booking.new(
    first_row: 0,
    first_seat: 3,
    last_row: 0,
    last_seat: 9)
  end

  context 'bookings that do not follow the rules' do

    it 'declines when booking contains more than 6 seats'do
      expect(BookingChecks.less_than_six_seats?(booking5)).to be false
    end

    it 'declines if all seats are not available' do
      seat_in(row: 0, seat: 3).available = false
      expect(BookingChecks.seats_available?(booking3, hall)).to be false
    end

    it 'declines if there is one gap between seats' do
      seat_in(row: 0, seat: 1).available = false
      expect(BookingChecks.leaves_more_than_one_gap?(booking3, hall)).to be false
    end

    it 'declines if the seat has one gap from the first seat of the row' do
      expect(BookingChecks.leaves_more_than_one_gap?(booking1, hall)).to be false
    end

    it 'declines if the seat has one gap from the last seat of the row' do
      expect(BookingChecks.leaves_more_than_one_gap?(booking, hall)).to be false
    end

    it 'declines if the seat has no gap from the first seat of the row' do
      seat_in(row: 0, seat: 0).available = false
      expect(BookingChecks.leaves_more_than_one_gap?(booking1, hall)).to be true
    end

  end

  context 'bookings that follow the rules ' do

    it 'accepts when bookings are on the same row' do
      expect(BookingChecks.seats_on_the_same_row?(booking3)).to be true
    end

    it 'accepts when bookings are on a different row' do
      expect(BookingChecks.seats_on_the_same_row?(booking4)).to be false
    end

    it 'accepts when booking contains less than 6 seats'do
      expect(BookingChecks.less_than_six_seats?(booking3)).to be true
    end

    it 'accepts if all seats are available' do
      expect(BookingChecks.seats_available?(booking3, hall)).to be true
    end

    it 'accepts if there is more than one gap between seats' do
      expect(BookingChecks.leaves_more_than_one_gap?(booking3, hall)).to be true
    end

    it 'accepts if the seat has no gap from the last seat of the row' do
      seat_in(row: 0, seat: 49).available = false
      expect(BookingChecks.leaves_more_than_one_gap?(booking, hall)).to be true
    end

  end

end
