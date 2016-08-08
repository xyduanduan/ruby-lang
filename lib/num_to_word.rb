class NumToWord
  NumberWithThousand = {0 => "", 1 => "thousand", 2 => "million", 3 => "billion", 4 => "trillion"}
  Hundred = "hundred"
  NumerWithTwentyToNinety = {0 => "", 2 => "twenty", 3 => "thirty", 4 => "forty",
                             5 => "fifty", 6 => "sixty", 7 => "seventy",
                             8 => "eighty", 9 => 'ninety'}

  NumberWithTen = {0 => "", 1 => "one", 2 => "two", 3 => "three", 
                   4 => "four", 5 => "five", 6 => "six", 7 => "seven",
                   8 => "eight", 9 => "nine"}

  NumberWithTenToTwenty = {0 => "", 10 => "ten", 11 => "eleven",
                           12 => "twelve", 13 => "thirteen",
                           14 => "fourteen", 15 => "fifteen",
                           16 => "sixteen", 17 => "seventeen",
                           18 => "eighteen", 19 => "nineteen"}

  def get_num_to_word
    input = gets.chomp
    output(input)
  end

  def output(input)
    raise InvalidInputException, 'Please enter a number' unless input.is_numberic?
    puts num_to_word(input)
  end

  def num_to_word(num)
    nums = number_with_thousand(num.to_i)
    t_nums_size = nums.size
    word = ""
    nums.each_with_index do |t_num, index|
      num_index = t_nums_size - index - 1
      word += read_hundred_word(t_num.flatten) + " " + NumberWithThousand[num_index]
      word += word_separator(t_num, num_index)
    end
    word.chomp
  end

  def read_hundred_word(nums)
    send("read_hundred_word_with_size_#{nums.size}", nums)
  end

  def read_hundred_word_with_size_3(nums)
    percentile = read_percentile(nums[0])
    tenth = read_tenth(nums[1], nums[2])
    tenth != "" ? percentile + " and " + tenth : percentile
  end

  def read_hundred_word_with_size_2(nums)
    if nums[1] >= 10
      percentile = read_percentile(nums[0])
      unit = read_unit(nums[1])
      unit != "" ? percentile + " and " + unit : percentile
    else
      read_tenth(nums[0], nums[1])
    end
  end

  def read_hundred_word_with_size_1(nums)
    read_unit(nums[0])
  end

  def read_percentile(percentile)
    NumberWithTen[percentile] + " " + Hundred
  end

  def read_tenth(tenth, unit)
    if unit == 0
      NumerWithTwentyToNinety[tenth]
    else
      NumerWithTwentyToNinety[tenth] + "-" + NumberWithTen[unit]
    end
  end

  def read_unit(unit)
    NumberWithTen.merge(NumberWithTenToTwenty)[unit]
  end

  def number_with_thousand(num)
    nums = []
    while num >= 1000
      tmp = num % 1000
      num = num / 1000
      nums << number_with_hundred(tmp)
    end
    nums << number_with_hundred(num)
    nums.reverse
  end

  def number_with_hundred(num)
    nums = []
    while num > 100
      tmp = num % 100
      num = num / 100
      nums << number_with_ten(tmp)
    end
    nums << number_with_ten(num)
    nums.reverse
  end

  def number_with_ten(num)
    num >= 20 ? num.to_s.scan(/\d/).collect(&:to_i) : num
  end

  def numbers_end_with_0(nums)
    nums.flatten.last == 0
  end

  def word_separator(nums, num_index)
    if num_index != 0
      numbers_end_with_0(nums) ? " " : ", "
    else
      ""
    end
  end

end

class String

  def is_numberic?
    Integer(self) rescue nil
  end

end