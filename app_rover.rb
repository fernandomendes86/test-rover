module AppRover
  
require_relative "lib/rover/plan"
require_relative "lib/rover/rover"

20.times {print "-"}; puts

def self.load_data
  begin
    file = File.open("data/input_data.txt")
    lines = file.readlines.map(&:chomp)
  rescue
    puts "File cannot be read!"
  end 
end

def self.execute_commands(commands, rover)
  commands.each do |c|
    case c
    when 'L'
      rover.turn_left
    when 'R'
      rover.turn_right
    when 'M'
      rover.next_position
    else
      "Command not found"
    end      
  end
end

def self.create_rover(params)
  Rover.new(params[0].to_i,params[1].to_i, params[2])
end

def self.output_data
  puts "Output Data: "
  @rover_a.print_position_guidance
  @rover_b.print_position_guidance
end

def self.output_plan
  puts "Output Plan: "
  @plan.set_rover(@rover_a)
  @plan.set_rover(@rover_b)
  @plan.print_rovers
end

data = self.load_data
array_plan = data[0].split
@plan = Plan.new(array_plan[0].to_i, array_plan[0].to_i)

data_rover_a = [data[1].split, data[2].split.first.split("")]
data_rover_b = [data[3].split, data[4].split.first.split("")]

@rover_a = self.create_rover(data_rover_a[0])
@rover_b = self.create_rover(data_rover_b[0])
commands_a = data_rover_a[1]
commands_b = data_rover_b[1]

self.execute_commands(commands_a, @rover_a)
self.execute_commands(commands_b, @rover_b)
    
self.output_data

20.times {print "-"}; puts

self.output_plan


end


   