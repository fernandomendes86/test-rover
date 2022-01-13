class Plan
  
  def initialize(codinator_y, codinator_x)
    @codinator_y = codinator_y 
    @codinator_x = codinator_x
    @plan = Array.new(@codinator_y + 1) {Array.new(@codinator_x + 1).fill("-") }
  end

  def get_array
    @plan
  end

  def set_rover(rover)
    @plan[@codinator_y - rover.position_y][rover.position_x] = "r" #rover
  end

  def get_rover(rover)
    @plan[@codinator_y - rover.position_y][rover.position_x]
  end

  def print_rovers
    print " "
    (0..@codinator_x).to_a.each { |x| print " #{x}" }
    puts
    (0..@codinator_y).to_a.reverse.map do |i|
      if @plan[i].size <= @codinator_x+1 
        @plan[i].unshift(@codinator_y-i)
      end
    end
    puts @plan.map { |x| x.join(' ') }
  end

end