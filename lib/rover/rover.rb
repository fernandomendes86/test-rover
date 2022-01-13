class Rover
  attr_accessor :position_x, :position_y, :guidance

  def initialize(position_x, position_y, guidance)
    @position_x = position_x
    @position_y = position_y
    @guidance = guidance
  end
  
end