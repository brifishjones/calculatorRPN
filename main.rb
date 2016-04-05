# main entry point for rpn calculator

if RUBY_VERSION < "1.9"
  puts RUBY_VERSION + " no longer supported"
  exit 
end
puts "RPN Calclator using Ruby version " + RUBY_VERSION


require './calc.rb'
rpn = Calculator.new 

ARGF.each do |line|
    puts rpn.process_input(line)
    rpn.ready
end
