namespace :test_rover do
  desc "Run test_rover application"
  task run: :environment do

    20.times {print "-"}
    puts
   
    data = load_data

    array_plan = data[0].split
    @plan = Plan.new(array_plan[0].to_i, array_plan[0].to_i)

    data_rover_a = [data[1].split, data[2].split.first.split("")]
    data_rover_b = [data[3].split, data[4].split.first.split("")]

    @rover_a = create_rover(data_rover_a[0])
    @rover_b = create_rover(data_rover_b[0])
    commands_a = data_rover_a[1]
    commands_b = data_rover_b[1]

    execute_commands(commands_a, @rover_a)
    execute_commands(commands_b, @rover_b)
    
    output_data
    puts
    output_plan

  end
  
  private 
    def execute_commands(commands, rover)
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

    def load_data
      begin
        file = File.open("#{Rails.root}/lib/rover/data/input_data.txt")
        lines = file.readlines.map(&:chomp)
      rescue
        puts "File cannot be read!"
      end 
    end

    def create_rover(params)
      Rover.new(params[0].to_i,params[1].to_i, params[2])
    end

    def output_data
      puts "Output Data: "
      @rover_a.print_position_guidance
      @rover_b.print_position_guidance
    end

    def output_plan
      puts "Output Plan: "
      @plan.set_rover(@rover_a)
      @plan.set_rover(@rover_b)
      @plan.print_rovers
    end

end

