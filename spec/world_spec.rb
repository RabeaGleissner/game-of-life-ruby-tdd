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
      world = World.new([[4,1], [2,2], [4,2], [9,2], [10,2], [4,3], [5,3], [9,3]], 16, 6)
      expect(world.identify_reborns).to match_array([[3, 1], [3, 3], [10, 3]])
    end
    it 'stays dead with only two alive neighbours' do
      world = World.new([[0,0],[0,1]], 3, 10)
      expect(world.identify_reborns).to match_array([])
    end
  end


  



end