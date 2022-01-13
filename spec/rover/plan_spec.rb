require 'rover/plan'

describe Plan do
  
  it 'Create plan 5x5' do
    @plan = Plan.new(5,5)
    expect(@plan.get_array).to be_an_instance_of(Array)
  end

end