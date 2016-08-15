require_relative('./spec_helper.rb')

describe FizzBuzz do

  describe '#get series' do

    context 'Fizz Buzz' do
      it 'can be aliquted by 3 and 5' do 
        result = series.process_input(15)
        expect(result).to eq('Fizz Buzz')
      end

      it 'or include 3 and 5' do 
        result = series.process_input(35)
        expect(result).to eq('Fizz Buzz')
      end
    end

    context 'Fizz' do
      it 'can be aliquted by 3' do 
        result = series.process_input(6)
        expect(result).to eq('Fizz')
      end

      it 'or include 3' do 
        result = series.process_input(13)
        expect(result).to eq('Fizz')
      end
    end

    context 'Buzz' do
      it 'can be aliquted by 5' do 
        result = series.process_input(20)
        expect(result).to eq('Buzz')
      end

      it 'or include 5' do 
        result = series.process_input(5)
        expect(result).to eq('Buzz')
      end
    end

    context 'input self num' do
      it 'cannot be aliquted by 3 and 5, neither include 3 and 5' do 
        result = series.process_input(2)
        expect(result).to eq('2')
      end
    end

    context 'raise error' do 
      it 'input is not a number' do
        expect{series.output('abc')}.to raise_error(InvalidInputException, "Please enter a number")
      end
    end

  end

  let(:series){Series.new}
end
