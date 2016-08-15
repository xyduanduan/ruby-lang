class NumToWord
  DECIMAL_UNITS = {0 => "", 1 => "thousand", 2 => "million", 3 => "billion", 4 => "trillion"}

  Hundred = "hundred"

  Twenty_To_Ninety = {0 => "", 2 => "twenty", 3 => "thirty", 4 => "forty",
                      5 => "fifty", 6 => "sixty", 7 => "seventy",
                      8 => "eighty", 9 => 'ninety'}
  
  Ten_To_Twenty = {0 => "", 10 => "ten", 11 => "eleven",
                   12 => "twelve", 13 => "thirteen",
                   14 => "fourteen", 15 => "fifteen",
                   16 => "sixteen", 17 => "seventeen",
                   18 => "eighteen", 19 => "nineteen"}

  Ten = {0 => "", 1 => "one", 2 => "two", 3 => "three", 
         4 => "four", 5 => "five", 6 => "six", 7 => "seven",
         8 => "eight", 9 => "nine"}

  ZERO = "zero"


  def get_num_to_word
    input = gets.chomp
    output(input)
  end

  def output(input)
    raise InvalidInputException, 'Please enter a number' unless input.is_numberic?
    puts num_to_word(input)
  end

  def num_to_word(num)
    return ZERO if num.to_i == 0
    word = ""
    nums = number_wrap(num.to_i)
    t_nums_size = nums.size
    nums.each_with_index do |t_num, index|
      num_index = t_nums_size - index - 1
      word += read_num_word(t_num.flatten) + " " + DECIMAL_UNITS[num_index]
      word += num.to_i % 1000 == 0 ? "" : word_separator(t_num, num_index)
    end
    word.strip
  end

  def read_num_word(nums)
    send("read_num_word_with_size_#{nums.size}", nums)
  end

  def read_num_word_with_size_3(nums)
    percentile = read_percentile(nums[0])
    tenth = read_tenth(nums[1], nums[2])
    tenth != "" ? percentile + " and " + tenth : percentile
  end

  def read_num_word_with_size_2(nums)
    if nums[1] >= 10
      percentile = read_percentile(nums[0])
      unit = read_unit(nums[1])
      unit != "" ? percentile + " and " + unit : percentile
    else
      read_tenth(nums[0], nums[1])
    end
  end

  def read_num_word_with_size_1(nums)
    read_unit(nums[0])
  end

  def read_percentile(percentile)
    Ten[percentile] + " " + Hundred
  end

  def read_tenth(tenth, unit)
    if unit == 0
      Twenty_To_Ninety[tenth]
    else
      tenth = Twenty_To_Ninety[tenth]
      unit = Ten[unit]
      tenth != "" ? tenth + "-" + unit : unit
    end
  end

  def read_unit(unit)
    Ten.merge(Ten_To_Twenty)[unit]
  end

  def number_wrap(num)
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
      nums << number_with_tenth(tmp)
    end
    nums << number_with_unit(num)
    nums.reverse
  end

  def number_with_tenth(num)
    num >= 20 ? num.to_s.scan(/\d/).collect(&:to_i) : fill_number_with_0(num)
  end

  def number_with_unit(num)
    num >= 20 ? num.to_s.scan(/\d/).collect(&:to_i) : num
  end

  def fill_number_with_0(num)
    num < 10 ? [0, num] : num
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