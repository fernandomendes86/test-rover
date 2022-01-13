class Rover
 
  attr_accessor :position_x, :position_y, :guidance
  $hash_left = { 'N': 'W', 'W': 'S', 'S': 'E', 'E': 'N'}
  $hash_right = { 'N': 'E', 'E': 'S', 'S': 'W', 'W': 'N'}

  def initialize(position_x, position_y, guidance)
    @position_x = position_x
    @position_y = position_y
    @guidance = guidance
  end

  def turn_left
    self.guidance = $hash_left[self.guidance.to_sym]  
  end

  def turn_right
    self.guidance = $hash_right[self.guidance.to_sym]  
  end

  def next_position
    case self.guidance
    when 'N'
      self.position_y = self.position_y + 1
    when 'S'
      self.position_y = self.position_y - 1
    when 'W'
      self.position_x = self.position_x - 1
    else
      self.position_x = self.position_x + 1
    end    
  end

  def print_position_guidance
    puts "#{self.position_x} #{self.position_y} #{self.guidance}"
  end
  
end