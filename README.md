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

4. All values are stored as strings so that "eval" can be used instead of writing
   separate add, subtract, multiply, and divide methods, as well as not having to
   figure out whether the number is an int, float, or exponential.

5. A leading 0 is inserted before a decimal so that eval works properly (e.g. .01 becomes 0.01).

6. Divide by 0 returns NaN if a least two tokens exist. If division is by two
   integers then a truncated integer is returned.

7. If the "Enter" key is pressed with no value, the last token on the stack is duplicated
   then added to the stack.

8. At any time the token array can be viewed by entering `p`.

## Usage

1. Make sure Ruby is installed. 

2. At the command prompt enter "ruby main.rb"

3. Calculator also works with data from a file. Enter "ruby main.rb < test-data.txt"

4. To run unit tests enter "ruby test.rb". Note that 2 of the tests fail due to rounding errors
   when using Ruby 1.9 and 2.2. There are no failures with 1.8.7.
