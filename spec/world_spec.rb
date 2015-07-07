require_relative 'spec_helper'
require_relative '../world'

describe World do
  let(:world){World.new()}
  
  it 'creates an empty world' do
    expect(world.create()).to eq []
  end
end