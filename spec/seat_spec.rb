require 'seat'

describe Seat do
  it 'is available initially' do
    seat = Seat.new(0, 0)
    expect(seat).to be_available
  end
  context 'seat and row numbers' do
    it 'knows its seat number when created' do
      seat = Seat.new(0, 0)
      expect(seat.number).to eq 0
    end

    it 'knows its row number when created' do
      seat = Seat.new(0, 0)
      expect(seat.row).to eq 0
    end

    it 'raises an error if the seat number is greater than 49' do
      expect(lambda { Seat.new(0, 50) }).to raise_error(RuntimeError)
    end
    
    it 'raises an error if the seat number is less than 0' do
      expect(lambda { Seat.new(0, -1) }).to raise_error(RuntimeError)
    end
  end
end
