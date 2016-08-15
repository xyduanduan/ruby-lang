class AutoWrap

  MAXIMUM = 6

  def get_auto_wrap
    input = gets.chomp
    output(input)
  end

  def output(input)
    puts process_input_with_gsub(input)
  end

  def process_input_with_gsub(str)
    str.gsub(/(\S*\s\S*){#{MAXIMUM - 1}}\s/){|s| "#{s}\n"}
  end

  def process_input_with_slice(str)
    str.split(/\s/).each_slice(MAXIMUM).map{|words_num| words_num.push("\n")}.join(" ")
  end

end