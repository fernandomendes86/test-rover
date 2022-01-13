class Rover
 
  attr_accessor :position_x, :position_y, :guidance
  $hash_left = { 'N': 'W', 'W': 'S', 'S': 'E', 'E': 'N'}

  def initialize(position_x, position_y, guidance)
    @position_x = position_x
    @position_y = position_y
    @guidance = guidance
  end

  def turn_left
    self.guidance = $hash_left[self.guidance.to_sym]  
  end
  
end