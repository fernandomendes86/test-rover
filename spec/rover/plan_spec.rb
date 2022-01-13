require 'rover/plan'
require 'rover/rover'

describe Plan do
  
  it 'Create plan 5x5' do
    plan = Plan.new(5,5)
    expect(plan.get_array).to be_an_instance_of(Array)
  end

  it 'Verify the rover in the plan' do
    plan = Plan.new(5,5)
    rover = Rover.new(1,2, "N")
    plan.set_rover(rover)
    expect(plan.get_rover(rover)).to eq("r")
  end

end