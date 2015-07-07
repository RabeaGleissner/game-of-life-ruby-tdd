require_relative 'spec_helper'
require_relative '../world'

describe World do

  it 'creates an empty world' do
    world = World.new([])
    expect(world.empty?).to eq true
  end

  describe 'alive cell' do
    it 'dies with no neighbours' do
      world = World.new([[0,0]])
      expect(world.still_alive?([0,0])).to eq false
    end

    it 'dies with only one neighbour' do
      world = World.new([[0,0],[0,1]])
      expect(world.still_alive?([0,0])).to eq false
    end


  end



end