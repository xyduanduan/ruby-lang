require_relative('minitest/fizz_buzz_test.rb')
require_relative('minitest/auto_wrap_test.rb')
require_relative('minitest/num_to_word_test.rb')

namespace :test do

  desc "fizz and buzz"
  task :fizz_buzz do
    ruby "minitest/fizz_buzz_test.rb"
  end

  desc "auto wrap"
  task :auto_wrap do
    ruby "minitest/auto_wrap_test.rb"
  end

  desc "number to words"
  task :number_to_words do
    ruby "minitest/num_to_word_test.rb"
  end

  task :all => [:fizz_buzz, :auto_wrap, :number_to_words]

end

task :test => "test:all"