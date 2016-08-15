require_relative('./minitest_helper.rb')

class TestFizzBuzz < Minitest::Test

  def setup
    @input = FizzBuzz.new
  end

  def fizz_buzz num
    @input.process_input num
  end

  def test_input_num_to_fizz_and_buzz
    assert_equal "Fizz Buzz", fizz_buzz(15)
    assert_equal "Fizz Buzz", fizz_buzz(35)
  end

  def test_input_num_to_fizz
    assert_equal "Fizz", fizz_buzz(6)
    assert_equal "Fizz", fizz_buzz(13)
  end

  def test_input_num_to_buzz
    assert_equal "Buzz", fizz_buzz(20)
    assert_equal "Buzz", fizz_buzz(5)
  end

  def test_input_num_to_self
    assert_equal "2", fizz_buzz(2)
  end

  def test_input_num_to_self
    assert_equal "2", fizz_buzz(2)
  end

  def test_input_is_not_a_num
    exception = assert_raises(InvalidInputException){@input.output('abc')}      
    assert_equal('Please enter a number', exception.message)
  end

end

