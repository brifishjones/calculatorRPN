require 'test/unit'
require './calc.rb'

class TestCalculator < Test::Unit::TestCase
  def test_input
    rpn = Calculator.new
    assert_not_nil(rpn)
    assert_equal(rpn.process_input("5"), "5")
    assert_equal(rpn.process_input("-32"), "-32")
    assert_equal(rpn.process_input("3.14"), "3.14")
    assert_equal(rpn.process_input("bad"), "Invalid input")
  end
  def test_addition
    rpn = Calculator.new
    assert_equal(rpn.process_input("100"), "100")
    assert_equal(rpn.process_input("65"), "65")
    assert_equal(rpn.process_input("+"), "165")
    assert_equal(rpn.process_input("+"), "165")
    assert_equal(rpn.process_input("3"), "3")
    assert_equal(rpn.process_input(""), "3")
    assert_equal(rpn.process_input("5.01"), "5.01")
    assert_equal(rpn.process_input("+"), "8.01")
    assert_equal(rpn.process_input("+"), "11.01")
  end
  def test_subtraction
    rpn = Calculator.new
    assert_equal(rpn.process_input("100"), "100")
    assert_equal(rpn.process_input("65"), "65")
    assert_equal(rpn.process_input("-"), "35")
    assert_equal(rpn.process_input("-"), "-35")
    assert_equal(rpn.process_input("-"), "-35")
    assert_equal(rpn.process_input("6"), "6")
    assert_equal(rpn.process_input(""), "6")
    assert_equal(rpn.process_input("5.01"), "5.01")
    assert_equal(rpn.process_input("-"), "0.99")
    assert_equal(rpn.process_input("-"), "5.01")
  end
  def test_multiplication
    rpn = Calculator.new
    assert_equal(rpn.process_input("-7"), "-7")
    assert_equal(rpn.process_input("8"), "8")
    assert_equal(rpn.process_input("*"), "-56")
    assert_equal(rpn.process_input("*"), "0")
    assert_equal(rpn.process_input("6"), "6")
    assert_equal(rpn.process_input(""), "6")
    assert_equal(rpn.process_input("5.01"), "5.01")
    assert_equal(rpn.process_input("*"), "30.06")
    assert_equal(rpn.process_input("2.0467e100"), "2.0467e100")
    assert_equal(rpn.process_input("1000"), "1000")
    assert_equal(rpn.process_input("*"), "2.0467e+103")
    assert_equal(rpn.process_input("-.000000001"), "-0.000000001")
    assert_equal(rpn.process_input("*"), "-2.0467e+94")
  end
  def test_division
    rpn = Calculator.new
    assert_equal(rpn.process_input("12"), "12")
    assert_equal(rpn.process_input("3"), "3")
    assert_equal(rpn.process_input("/"), "4")
    assert_equal(rpn.process_input("/"), "0")
    assert_equal(rpn.process_input("6"), "6")
    assert_equal(rpn.process_input("0"), "0")
    assert_equal(rpn.process_input("/"), "NaN")
    assert_equal(rpn.process_input("14"), "14")
    assert_equal(rpn.process_input("5"), "5")
    assert_equal(rpn.process_input("/"), "2.8")
    assert_equal(rpn.process_input("15"), "15")
    assert_equal(rpn.process_input("2.0"), "2.0")
    assert_equal(rpn.process_input("/"), "7.5")
  end
  def test_stack
    rpn = Calculator.new
    assert_equal(rpn.process_input("p"), '["0"]')
    assert_equal(rpn.process_input("1"), "1")
    assert_equal(rpn.process_input("p"), '["0", "1"]')
    assert_equal(rpn.process_input("2"), "2")
    assert_equal(rpn.process_input("p"), '["0", "1", "2"]')
    assert_equal(rpn.process_input(""), "2")
    assert_equal(rpn.process_input("p"), '["0", "1", "2", "2"]')
    assert_equal(rpn.process_input("+"), "4")
    assert_equal(rpn.process_input("p"), '["0", "1", "4"]')
    assert_equal(rpn.process_input("-"), "-3")
    assert_equal(rpn.process_input("p"), '["0", "-3"]')
    assert_equal(rpn.process_input("-"), "3")
    assert_equal(rpn.process_input("p"), '["3"]')
    assert_equal(rpn.process_input("/"), "3")
    assert_equal(rpn.process_input("p"), '["3"]')
  end

end
