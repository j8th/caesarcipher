require "alpha"

include CaesarCipher

describe Alpha do 

  let(:test_obj) { Class.new {extend Alpha} }

  describe ".reindex" do 

    it "returns a number 0 to 25" do 
      expected = 12
      actual = test_obj.reindex(38)
      expect(actual).to eq(expected)
    end
  end

  describe ".upcase?" do 

    it "returns true if the character is uppercase and false otherwise" do
      
      inputs_and_outputs = { "A" => true, "!" => false, "t" => false}

      inputs_and_outputs.each do |input, output|
        expected = output
        actual = test_obj.upcase?(input)
        expect(actual).to eq(expected)
      end
    end
  end


  describe ".letter?" do 

    it "returns true if the character is a letter and false otherwise" do 
      expected = false
      actual = test_obj.letter?("#")
      expect(actual).to eq(expected)
    end
  end

  describe ".start_ascii" do 

    it "returns A if the character is uppercase and a if the letter is lowercase" do 
      expected = "a"
      actual = test_obj.start_ascii("g")
      expect(actual).to eq(expected)
    end
  end
end
