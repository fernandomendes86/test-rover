require "rover/rover"

describe Rover do

  before(:all) do
    @rover_a = Rover.new(1, 2,'N') 
    @rover_b = Rover.new(3, 3, 'E')
  end 

  it 'Create rovers A e B' do
    expect(@rover_a).to have_attributes(position_x: 1, position_y: 2, guidance: 'N')
    expect(@rover_b).to have_attributes(position_x: 3, position_y: 3, guidance: 'E')
  end

  it 'Rover A - turn left' do
    @rover_a.turn_left
    expect(@rover_a).to have_attributes(guidance: 'W')

    @rover_a.turn_left
    expect(@rover_a).to have_attributes(guidance: 'S')
    
    @rover_a.turn_left
    expect(@rover_a).to have_attributes(guidance: 'E')
    
    @rover_a.turn_left
    expect(@rover_a).to have_attributes(guidance: 'N')
  end

  it 'Rover B - turn right' do
    @rover_b.turn_right
    expect(@rover_b).to have_attributes(guidance: 'S')
    
    @rover_b.turn_right
    expect(@rover_b).to have_attributes(guidance: 'W')
    
    @rover_b.turn_right
    expect(@rover_b).to have_attributes(guidance: 'N')
    
    @rover_b.turn_right
    expect(@rover_b).to have_attributes(guidance: 'E')
  end

end