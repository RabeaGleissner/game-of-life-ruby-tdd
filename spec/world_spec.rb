require_relative 'spec_helper'
require_relative '../world'

describe World do

  it 'creates an empty world' do
    world = World.new([], 3, 3)
    expect(world.empty?).to eq true
  end

  describe 'alive cell' do
    it 'dies with no neighbours' do
      world = World.new([[0,0]], 3, 3)
      expect(world.still_alive?([0,0])).to eq false
    end

    it 'dies with only one neighbour' do
      world = World.new([[0,0],[0,1]], 3, 3)
      expect(world.still_alive?([0,0])).to eq false
    end

    it 'survives with two neighbours' do
      world = World.new([[0,0],[0,1],[1,0]], 3, 3)
      expect(world.still_alive?([0,0])).to eq true
    end
    it 'survives with three neighbours' do
      world = World.new([[0,0],[0,1],[1,0], [1,1]], 3, 3)
      expect(world.still_alive?([1,1])).to eq true
    end
    it 'dies with four neighbours' do
      world = World.new([[0,0],[0,1],[1,0], [1,1], [2,1]], 3, 3)
      expect(world.still_alive?([1,1])).to eq false
    end
    it 'dies with five neighbours' do
      world = World.new([[0,0],[0,1],[1,0], [1,1], [2,1], [2,0]], 3, 3)
      expect(world.still_alive?([1,1])).to eq false
    end
  end

  describe 'dead cell' do
    it 'has three alive neighbours and is reborn' do
      world = World.new([[0,0], [0,1], [1,0]], 3, 3)
      expect(world.identify_reborns).to match_array([[1,1]])
    end
  end


  



end