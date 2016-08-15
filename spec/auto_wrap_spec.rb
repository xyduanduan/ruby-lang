require_relative('./spec_helper.rb')

describe AutoWrap do 

  describe '#get line' do

    context '.with gsub' do
      it 'input is shorter than the Maximum words' do
        str = "gsub gsub gsub gsub"
        gsub_str = wrap.process_input_with_gsub(str)
        expect(gsub_str).not_to include("\n")
      end

      it 'input is equal to the Maximum words' do
        str = "gsub gsub gsub gsub gsub gsub"
        gsub_str = wrap.process_input_with_gsub(str)
        expect(gsub_str).not_to include("\n")
      end

      it 'input is longer than the Maximum words' do
        str =<<-eos
         gsub gsub gsub gsub gsub gsub gsub
         gsub gsub gsub gsub gsub gsub gsub
         gsub gsub gsub gsub gsub gsub gsub
         gsub gsub gsub
        eos
        
        gsub_str = wrap.process_input_with_gsub(str)
        line_size = gsub_str.split("\n").size

        expect(gsub_str).to include("\n")
        expect(line_size).to eq(13)
      end
    end

  end

  let(:wrap){Wrap.new}
end