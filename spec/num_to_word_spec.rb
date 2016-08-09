require_relative('./spec_helper.rb')

describe NumToWord do

  describe '#get num to word' do

    context 'ones place' do
      it " 0 " do 
        result = input.num_to_word(0)
        expect(result).to eq("")
      end

      it " 9 " do 
        result = input.num_to_word(9)
        expect(result).to eq("nine")
      end
    end

    context 'tens place' do
      it " 10 " do 
        result = input.num_to_word(10)
        expect(result).to eq("ten")
      end

      it " 20 " do 
        result = input.num_to_word(20)
        expect(result).to eq("twenty")
      end
    end

    context 'hundreds place' do
      it " 100 " do 
        result = input.num_to_word(100)
        expect(result).to eq("one hundred")
      end

      it " 110 " do 
        result = input.num_to_word(110)
        expect(result).to eq("one hundred and ten")
      end

      it " 111 " do 
        result = input.num_to_word(111)
        expect(result).to eq("one hundred and eleven")
      end

      it " 122 " do 
        result = input.num_to_word(120)
        expect(result).to eq("one hundred and twenty")
      end
    end

    context 'thousands place' do
      it " 1000 " do 
        result = input.num_to_word(1000)
        expect(result).to eq("one thousand")
      end

      it " 1100 " do 
        result = input.num_to_word(1100)
        expect(result).to eq("one thousand, one hundred")
      end

      it " 1110 " do 
        result = input.num_to_word(1110)
        expect(result).to eq("one thousand, one hundred and ten")
      end

      it " 1233 " do 
        result = input.num_to_word(1233)
        expect(result).to eq("one thousand, two hundred and thirty-three")
      end
    end

    context 'millions place' do
    end

    context 'billion place' do
    end


    context 'trillion place' do
      it '1111111111111' do 
        result = input.num_to_word(1111111111111)
        expect(result).to eq("one trillion, one hundred and eleven billion, one hundred and eleven million, one hundred and eleven thousand, one hundred and eleven")
      end
    end

    context 'raise error' do 
      it 'input is not a number' do
        expect{input.output('abc')}.to raise_error(InvalidInputException, "Please enter a number")
      end
    end


  end

let(:input){NumToWord.new}
end