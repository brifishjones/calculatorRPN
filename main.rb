# main entry point for rpn calculator
require './calc.rb'

rpn = Calculator.new 

ARGF.each do |line|
    puts rpn.process_input(line)
    rpn.ready
end
