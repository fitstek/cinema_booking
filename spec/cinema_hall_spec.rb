require 'cinema_hall'
require_relative '../spec_helper.rb'

describe CinemaHall do
  let(:hall) { CinemaHall.new(hall_number: 1) }
  let(:booking) do
    Booking.new(
    first_row: 0,
    first_seat: 0,
    last_row: 0,
    last_seat: 0)
  end
  let(:booking2) do
    Booking.new(
    first_row: 0,
    first_seat: 3,
    last_row: 0,
    last_seat: 4)
  end
  let(:booking3) do
    Booking.new(
    first_row: 0,
    first_seat: 4,
    last_row: 0,
    last_seat: 5)
  end
  let(:booking4) do
    Booking.new(
    first_row: 0,
    first_seat: 1,
    last_row: 0,
    last_seat: 4)
  end
  let(:booking5) do
    Booking.new(
    first_row: 0,
    first_seat: 48,
    last_row: 0,
    last_seat: 48)
  end
  let(:booking6) do
    Booking.new(
    first_row: 0,
    first_seat: 2,
    last_row: 0,
    last_seat: 8)
  end
  let(:booking7) do
    Booking.new(
    first_row: 1,
    first_seat: 2,
    last_row: 0,
    last_seat: 2)
  end

  it 'initializes with a hall number' do
    expect(hall.number).to eq 1
  end

  it 'contains 100 row objects' do
    expect(hall.rows.count).to eq 100
  end

  it 'can book seats' do
    hall.book(booking, hall)
    expect(seat_in(row: 0, seat: 0)).to be_booked
  end

  context 'seats that do not meet the criterion' do
    it 'seat 1 when seat 0 is not booked' do
      hall.book(booking4, hall)
      expect(seat_in(row: 0, seat: 1)).not_to be_booked
      expect(seat_in(row: 0, seat: 2)).not_to be_booked
      expect(seat_in(row: 0, seat: 3)).not_to be_booked
      expect(seat_in(row: 0, seat: 4)).not_to be_booked
    end

    it 'seat 48 when seat 49 is not booked' do
      hall.book(booking5, hall)
      expect(seat_in(row: 0, seat: 48)).not_to be_booked
    end

    it 'when there are more than 5 seats in the booking' do
      hall.book(booking6, hall)
      expect(seat_in(row: 0, seat: 2)).not_to be_booked
      expect(seat_in(row: 0, seat: 4)).not_to be_booked
      expect(seat_in(row: 0, seat: 6)).not_to be_booked
      expect(seat_in(row: 0, seat: 8)).not_to be_booked
    end

    it 'when any of the seats are already booked already booked' do
      seat_in(row: 0, seat: 4).available = false
      hall.book(booking3, hall)

      # This seat was booked previously
      expect(seat_in(row: 0, seat: 4)).to be_booked
      expect(seat_in(row: 0, seat: 5)).not_to be_booked
    end

    it 'leaves a gap of one' do
      seat_in(row: 0, seat: 2).available = false
      hall.book(booking3, hall)
      expect(seat_in(row: 0, seat: 4)).not_to be_booked
      expect(seat_in(row: 0, seat: 5)).not_to be_booked
    end

    it 'seats not on the same row' do
      hall.book(booking7, hall)
      expect(seat_in(row: 0, seat: 2)).not_to be_booked
      expect(seat_in(row: 1, seat: 2)).not_to be_booked
    end
  end

  context 'seats that meet the criterion' do
    it 'seat 1 when seat 0 is booked' do
      seat_in(row: 0, seat: 0).available = false
      hall.book(booking4, hall)
      expect(seat_in(row: 0, seat: 1)).to be_booked
      expect(seat_in(row: 0, seat: 2)).to be_booked
      expect(seat_in(row: 0, seat: 3)).to be_booked
      expect(seat_in(row: 0, seat: 4)).to be_booked
    end
    it 'seat 48 when seat 49 is booked' do
      seat_in(row: 0, seat: 49).available = false
      hall.book(booking5, hall)
      expect(seat_in(row: 0, seat: 48)).to be_booked
    end
    it 'when there are less than 5 seats in the booking' do
      hall.book(booking3, hall)
      expect(seat_in(row: 0, seat: 4)).to be_booked
      expect(seat_in(row: 0, seat: 5)).to be_booked
    end

    it 'leaves a gap of more than one' do
      hall.book(booking, hall)
      hall.book(booking2, hall)
      expect(seat_in(row: 0, seat: 0)).to be_booked
      expect(seat_in(row: 0, seat: 3)).to be_booked
      expect(seat_in(row: 0, seat: 4)).to be_booked
    end
    it 'seats on the same row' do
      hall.book(booking2, hall)
      expect(seat_in(row: 0, seat: 3)).to be_booked
      expect(seat_in(row: 0, seat: 4)).to be_booked
    end
  end
end
