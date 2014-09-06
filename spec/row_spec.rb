require 'row'

describe Row do
	it 'it initially knows it\'s number' do
		row = Row.new(0)
		expect(row.number).to eq 0
	end 

end