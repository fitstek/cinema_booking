require 'cinema_hall'

describe CinemaHall do
	let(:hall) { CinemaHall.new(1) }
	let(:booking) { Booking.new(0,0,0,0) }
	let(:booking2) { Booking.new(0,3,0,4) }
	let(:booking3) { Booking.new(0,4,0,5) }
	it 'initializes with a hall number' do
		expect(hall.number).to eq 1
	end

	it 'contains 100 row objects' do
		expect(hall.rows.count).to eq 100
	end

	it 'books seats' do
		hall.book(booking, hall)
		expect(hall.rows[0].seats[0]).to be_booked
	end

  context 'next seat' do

    it 'knows seat 1 is next to seat 0' do
      expect(hall.next(hall.rows[0].seats[0]).number).to eq 1
    end

    it 'knows to return nil for seat 49' do
      expect(hall.next(hall.rows[0].seats[49])).to eq nil
    end    
  end

  context 'previous seat' do

    it 'knows seat 0 is previous to seat 1' do
      expect(hall.previous(hall.rows[0].seats[1]).number).to eq 0
    end

    it 'knows to return nil for seat 0' do
      expect(hall.previous(hall.rows[0].seats[0])).to eq nil
    end    
  end

  context 'edge seats' do

    it 'knows 0 is an edge seats' do
      expect(hall.edge?(hall.rows[0].seats[0])).to eq true
    end

    it 'knows 10 is not an edge seats' do
      expect(hall.edge?(hall.rows[0].seats[10])).to eq false
    end    
  end

	context 'seats that do not meet the criterion' do
		it 'seat 1 when seat 0 is not booked' do
			hall.book(Booking.new(0,1,0,4), hall)
			expect(hall.rows[0].seats[2]).not_to be_booked
		end
    it 'seat 48 when seat 49 is not booked' do
      hall.book(Booking.new(0,48,0,48), hall)
      expect(hall.rows[0].seats[48]).not_to be_booked
    end
    it 'when there are more than 5 seats in the booking' do
      hall.book(Booking.new(0,2,0,8), hall)
      expect(hall.rows[0].seats[2]).not_to be_booked
    end
    it 'seat is already booked' do
      hall.book(Booking.new(0,2,0,4), hall)
      hall.book(Booking.new(0,4,0,6), hall)
      expect(hall.rows[0].seats[5]).not_to be_booked
    end

    it 'leaves a gap of one' do
      hall.book(Booking.new(0,2,0,4), hall)
      hall.book(Booking.new(0,6,0,6), hall)
      expect(hall.rows[0].seats[6]).not_to be_booked
    end
    it 'seats not on the same row' do
      hall.book(Booking.new(1,4,0,2), hall)
      expect(hall.rows[0].seats[2]).not_to be_booked
    end
	end

  context 'seats that meet the criterion' do
    it 'seat 1 when seat 0 is booked' do
      hall.book(Booking.new(0,0,0,0), hall)
      hall.book(Booking.new(0,1,0,4), hall)
      expect(hall.rows[0].seats[2]).to be_booked
    end
    it 'seat 48 when seat 49 is booked' do
      hall.book(Booking.new(0,49,0,49), hall)
      hall.book(Booking.new(0,48,0,48), hall)
      expect(hall.rows[0].seats[48]).to be_booked
    end
    it 'when there are less than 5 seats in the booking' do
      hall.book(Booking.new(0,2,0,6), hall)
      expect(hall.rows[0].seats[2]).to be_booked
    end

    it 'leaves a gap of more than one' do
      hall.book(Booking.new(0,2,0,4), hall)
      hall.book(Booking.new(0,7,0,7), hall)
      expect(hall.rows[0].seats[7]).to be_booked
    end
    it 'seats on the same row' do
      hall.book(Booking.new(0,2,0,4), hall)
      expect(hall.rows[0].seats[3]).to be_booked
    end
  end
end