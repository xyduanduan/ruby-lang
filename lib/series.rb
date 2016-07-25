require_relative('exception.rb')

class Series

  FizzNUM = 3
  BuzzNUM = 5

  def get_series
    input = gets.chomp
    output(input)
  end

  def output(input)
    raise InvalidInputException, 'Please enter a number' unless input.is_numberic?
    1.upto(input.to_i) do |value|
      series = process_input(value)
      puts series
    end
  end

  def process_input(value)
    str = value.to_s
    if (str.can_be_aliquted_by?(FizzNUM) && str.can_be_aliquted_by?(BuzzNUM)) ||
       (str.is_include?(FizzNUM) && str.is_include?(BuzzNUM))
      "Fizz Buzz"
    elsif str.can_be_aliquted_or_include?(FizzNUM)
      "Fizz"
    elsif  str.can_be_aliquted_or_include?(BuzzNUM)
      "Buzz"
    else
      str
    end
  end

end

class String

  def is_numberic?
    Integer(self) rescue nil
  end

  def can_be_aliquted_by?(num)
    self.to_i % num == 0
  end

  def is_include?(num)
    self.include? num.to_s 
  end

  def can_be_aliquted_or_include?(num)
    can_be_aliquted_by?(num) || is_include?(num)
  end

end