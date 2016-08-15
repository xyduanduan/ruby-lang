require_relative('./minitest_helper.rb')

class TestAutoWrap < Minitest::Test

  def setup
    @input = AutoWrap.new
  end

  def auto_wrap str
    @input.process_input_with_gsub str
  end

  def test_input_is_shorter_than_maximum_words
    str = "gsub gsub gsub gsub"
    refute_includes auto_wrap(str), "\n"
  end

  def test_input_is_equal_to_maximum_words
    str = "gsub gsub gsub gsub gsub gsub"
    refute_includes auto_wrap(str), "\n"
  end

  def test_input_is_longer_than_maximum_words
    str = <<-eos
         gsub gsub gsub gsub gsub gsub gsub
         gsub gsub gsub gsub gsub gsub gsub
         gsub gsub gsub gsub gsub gsub gsub
         gsub gsub gsub
    eos
    gsub_str = auto_wrap(str)
    line_size = gsub_str.split("\n").size

    assert_includes gsub_str, "\n"
    assert_equal 13, line_size
  end

end
