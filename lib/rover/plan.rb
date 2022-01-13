class Plan
  
  def initialize(codinator_y, codinator_x)
    @codinator_y = codinator_y 
    @codinator_x = codinator_x
    @plan = Array.new(@codinator_y + 1) {Array.new(@codinator_x + 1).fill("-") }
  end

  def get_array
    @plan
  end

end