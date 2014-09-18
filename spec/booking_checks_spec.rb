require 'booking_checks'

describe BookingChecks do
  let(:hall) { CinemaHall.new(1) }
  let(:booking) { Booking.new(0, 46, 0, 48) }
  let(:booking1) { Booking.new(0, 1, 0, 4) }
  let(:booking2) { Booking.new(0, 3, 0, 6) }
  let(:booking3) { Booking.new(0, 3, 0, 4) }
  let(:booking4) { Booking.new(0, 3, 1, 4) }
  let(:booking5) { Booking.new(0, 3, 0, 9) }

  it 'gives true when bookings are on the same row' do
    expect(BookingChecks.seats_on_the_same_row?(booking3)).to eq true
  end

  it 'gives false when bookings are on the same row' do
    expect(BookingChecks.seats_on_the_same_row?(booking4)).to eq false
  end

  it 'gives true when booking contains less than 6 seats'do
    expect(BookingChecks.less_than_six_seats?(booking3)).to eq true
  end

  it 'gives false when booking contains more than 6 seats'do
    expect(BookingChecks.less_than_six_seats?(booking5)).to eq false
  end

  it 'gives true if all seats are available' do
    expect(BookingChecks.seats_available?(booking3, hall)).to eq true
  end

  it 'gives false if all seats are not available' do
    hall.rows[0].seats[3].available = false
    expect(BookingChecks.seats_available?(booking3, hall)).to eq false
  end

  it 'gives false if there is one gap between seats' do
    hall.rows[0].seats[1].available = false
    expect(BookingChecks.leaves_more_than_one_gap?(booking3, hall)).to eq false
  end

  it 'gives true if there is more than one gap between seats' do
    expect(BookingChecks.leaves_more_than_one_gap?(booking3, hall)).to eq true
  end

  it 'gives false if the seat has one gap from the first seat of the row' do
    expect(BookingChecks.leaves_more_than_one_gap?(booking1, hall)).to eq false
  end

  it 'gives false if the seat has one gap from the last seat of the row' do
    expect(BookingChecks.leaves_more_than_one_gap?(booking, hall)).to eq false
  end

  it 'gives true if the seat has no gap from the last seat of the row' do
    hall.rows[0].seats[49].available = false
    expect(BookingChecks.leaves_more_than_one_gap?(booking, hall)).to eq true
  end

  it 'gives true if the seat has no gap from the first seat of the row' do
    hall.rows[0].seats[0].available = false
    expect(BookingChecks.leaves_more_than_one_gap?(booking1, hall)).to eq true
  end
end
