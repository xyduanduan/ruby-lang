require_relative("./minitest_helper")

class TestNumToWord < Minitest::Test

  def setup
    @input = NumToWord.new
  end

  def num_to_word num
    @input.num_to_word num
  end

  def test_input_is_unit_0
    assert_equal "zero", num_to_word(0)
  end

  def test_input_is_unit_9
    assert_equal "nine", num_to_word(9)
  end

  def test_input_is_tenth_10
    assert_equal "ten", num_to_word(10)
  end

  def test_input_is_tenth_20
    assert_equal "twenty", num_to_word(20)
  end

  def test_input_is_hundred_100
    assert_equal "one hundred", num_to_word(100)
  end

  def test_input_is_hundred_101
    assert_equal "one hundred and one", num_to_word(101)
  end

  def test_input_is_hundred_110
    assert_equal "one hundred and ten", num_to_word(110)
  end

  def test_input_is_hundred_122
    assert_equal "one hundred and twenty-two", num_to_word(122)
  end

  def test_input_is_thousand_1000
    assert_equal "one thousand", num_to_word(1000)
  end

  def test_input_is_thousand_1001
    assert_equal "one thousand, one", num_to_word(1001)
  end

  def test_input_is_thousand_1011
    assert_equal "one thousand, eleven", num_to_word(1011)
  end

  def test_input_is_thousand_1051
    assert_equal "one thousand, fifty-one", num_to_word(1051)
  end

  def test_input_is_thousand_1101
    assert_equal "one thousand, one hundred and one", num_to_word(1101)
  end

  def test_input_is_thousand_1234
    assert_equal "one thousand, two hundred and thirty-four", num_to_word(1234)
  end

  def test_input_is_trillion_1111111111111
    assert_equal "one trillion, one hundred and eleven billion, one hundred and eleven million, one hundred and eleven thousand, one hundred and eleven",
                 num_to_word(1111111111111)
  end

  def test_input_is_not_a_num
    exception = assert_raises(InvalidInputException){@input.output('abc')}      
    assert_equal('Please enter a number', exception.message)
  end

end