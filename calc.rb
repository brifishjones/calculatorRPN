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
    return false, "NaN" if @tokens.last == "0" && operator == '/' 
    return true
  end

  def append(token)
    token.sub!(/^(\-?)(\.)/, "\\10\\2")   # insist that there is a leading 0 before any decimal point
    @tokens.push(token)
    @tokens.last
  end

  def calculate(operator)
    valid, msg = validate(operator)
    return msg if !valid
    b = @tokens.pop
    a = @tokens.pop
    append(String(eval(String(a) + operator + String(b))))
  end

end