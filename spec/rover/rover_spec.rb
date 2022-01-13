require "rover/rover"

describe Rover do
  it 'create rovers' do
    @rover_a = Rover.new(1, 2,'N')
    @rover_b = Rover.new(3, 3, 'E')
    expect(@rover_a).to have_attributes(position_x: 1, position_y: 2, guidance: 'N')
    expect(@rover_b).to have_attributes(position_x: 3, position_y: 3, guidance: 'E')
  end
end