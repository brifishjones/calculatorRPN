# calculatorRPN
Reverse Polish Notation Calculator written in Ruby

## Specifications

1. The calculator should use standard input and standard output.

2. It should implement the four standard arithmetic operators.

3. It should support negative and decimal numbers, and should not have
   arbitrary limits on the number of operations.

4. The calculator should not allow invalid or undefined behavior.

5. The calculator should exit when it receives a `q` command or an end of input 
   indicator (EOF).

## Design

1. The Calculator class (in calc.rb) makes use of an array of tokens (operands) to facilitate 
   easy pushing and popping of values. It is initialized with "0" and is never empty.

2. The operators array contains the four standard arithmetic operators (+, -, \*, /)

3. If there is only one token then its value is returned when an operator is entered. 

4. All values are stored as strings and Object#method is used instead of writing
   separate add, subtract, multiply, and divide methods. (e.g. 4.method('+').(7))

5. Calculations are done using BigDecimals to prevent rounding errors.

6. Divide by 0 returns NaN if a least two tokens exist. If division is by two
   integers and there is a remainder then a decimal is returned.

7. If the "Enter" key is pressed with no value, the last token on the stack is duplicated
   then added to the stack.

8. At any time the token array can be viewed by entering `p`.

## Usage

1. Make sure Ruby 1.9.3 or later is installed. 

2. At the command prompt enter "ruby main.rb"

3. Calculator also works with data from a file. Enter "ruby main.rb < test-data.txt"

4. To run unit tests enter "ruby test.rb". 
