require 'position'

describe Position do
  
  let(:position) { Position.new('01E') }

  context 'initialisation' do

    it 'should have an x-value' do
      expect(position.x).to eq 0
    end

    it 'should have a y-value' do
      expect(position.y).to eq 1
    end

    it 'should have an orientation angle theta' do
      expect(position.theta).to eq 90
    end

    it 'should raise an error if x > 50' do
      expect{ Position.new('5100N') }.to raise_error(RuntimeError)
    end

    it 'should raise an error if y > 50' do
      expect{ Position.new('0051N') }.to raise_error(RuntimeError)
    end

  end

  context '#update' do

    let(:r_ins) { Instruction.new('R')  }
    let(:l_ins) { Instruction.new('L')  }
    let(:f_ins) { Instruction.new('F')  }

    it 'can modify its position based on an R instruction' do
      position.update(r_ins)
      expect(position.theta).to eq 180
      expect(position.x).to eq 0
      expect(position.y).to eq 1
    end

    it 'can modify its position based on an L instruction' do
      position.update(l_ins)
      expect(position.theta).to eq 0
      expect(position.x).to eq 0
      expect(position.y).to eq 1
    end

    it 'can modify its position based on an F instruction' do
      position.update(f_ins)
      expect(position.theta).to eq 90
      expect(position.x).to eq 1
      expect(position.y).to eq 1
    end

  end

  context '#to_s' do

    it 'can be converted back into a position string' do
      expect(position.to_s).to eq '01E'
    end

  end

end