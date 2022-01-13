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

  it 'Rover - turn left - next position of N to W' do
    @rover_a.turn_left
    previous_postion_x = @rover_a.position_x
    @rover_a.next_position
    expect(@rover_a.guidance).to eq('W')
    expect(@rover_a.position_x).to eq(previous_postion_x - 1)
  end

  it 'Rover - turn left - next position of W to S' do
    @rover_a.turn_left
    previous_position_y = @rover_a.position_y
    @rover_a.next_position
    expect(@rover_a.guidance).to eq('S')
    expect(@rover_a.position_y).to eq(previous_position_y - 1)
  end

  it 'Rover - turn left - next position of S to E' do
    @rover_a.turn_left
    previous_position_x = @rover_a.position_x
    @rover_a.next_position
    expect(@rover_a.guidance).to eq('E')
    expect(@rover_a.position_x).to eq(previous_position_x + 1)
  end

  it 'Rover - turn left - next position of E to N' do
    @rover_a.turn_left
    previous_position_y = @rover_a.position_y
    @rover_a.next_position
    expect(@rover_a.guidance).to eq('N')
    expect(@rover_a.position_y).to eq(previous_position_y + 1)
  end

  it 'Rover - turn right - next position of E to S' do
    @rover_b.turn_right
    previous_postion_y = @rover_b.position_y
    @rover_b.next_position
    expect(@rover_b.guidance).to eq('S')
    expect(@rover_b.position_y).to eq(previous_postion_y - 1)
  end

  it 'Rover - turn right - next position of S to W' do
    @rover_b.turn_right
    previous_postion_x = @rover_b.position_x
    @rover_b.next_position
    expect(@rover_b.guidance).to eq('W')
    expect(@rover_b.position_x).to eq(previous_postion_x - 1)
  end

  it 'Rover - turn right - next position of W to N ' do
    @rover_b.turn_right
    previous_postion_y = @rover_b.position_y
    @rover_b.next_position
    expect(@rover_b.guidance).to eq('N')
    expect(@rover_b.position_y).to eq(previous_postion_y + 1)
  end

  it 'Rover - turn right - next position of N to E ' do
    @rover_b.turn_right
    previous_postion_x = @rover_b.position_x
    @rover_b.next_position
    expect(@rover_b.guidance).to eq('E')
    expect(@rover_b.position_x).to eq(previous_postion_x + 1)
  end


end