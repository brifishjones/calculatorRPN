require 'bigdecimal'
require 'bigdecimal/util'

class Calculator

  def process_input(line)
    token = line.chomp
    exit if token == "q"
    if is_numeric?(token) 
      append(token)
    elsif token == 'p'
      @tokens.inspect
    elsif token == ''
      append(@tokens.last)
    elsif @operators.include?(token)
      calculate(token) 
    else
     "Invalid input"
    end
  end

  def ready
    print '> '
  end

private
  def initialize
    # tokens are the operands (i.e. valid numbers)
    @tokens = ["0"]   # by design @tokens array can never be empty
    @operators = ['+', '-', '*', '/']
    ready
  end

  def is_numeric?(line) 
    true if Float(line) rescue false
  end

  def validate(operator)
    return false, @tokens.last if @tokens.length == 1
    return false, "NaN" if operator == '/' && @tokens.last == "0"
    return true
  end

  def append(token)
    @tokens.push(token)
    @tokens.last
  end

  def calculate(operator)
    valid, msg = validate(operator)
    return msg if !valid
    # convert to BigDecimal to avoid rounding errors
    b = @tokens.pop.to_d
    a = @tokens.pop.to_d
    # Do the calculation, convert to float then string, and remove trailing .0 if result is an integer
    # Thanks to http://stackoverflow.com/questions/20019668/ruby-string-to-operator for a better way to deal with '+', '-', '*', and '/' 
    append((a.method(operator).(b)).to_f.to_s.sub(/\.0$/, ""))
  end

end
