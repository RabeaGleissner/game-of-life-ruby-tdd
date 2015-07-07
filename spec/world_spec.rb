require_relative 'spec_helper'
require_relative '../world'

describe World do
  let(:world){World.new()}

  it 'creates an empty world' do
    expect(world.create()).to eq []
  end

  describe 'alive cell' do
    it 'kills one living cell with no neighbours' do
      expect(world.create([0,0])). to eq []
    end
  end



end