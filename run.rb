require_relative 'lib/mission_control'

def object_params
  [
    Robot,
    Position,
    Grid,
    Square,
    Mission,
    Instruction
  ]
end

def file
  ARGV.first
end

def print_usage_msg
  puts "[usage] ruby run.rb 'filename'"
end

def launch
  mission_control = MissionControl.new(file, *object_params)
  puts mission_control.launch!
end

def main
  file ? launch : print_usage_msg
end

#-----------!!!-----------
#---------Run Call---------
main