require "caesar_cipher"

describe CaesarCipher do

  let(:caesar_cipher){ CaesarCipher.new }

  describe ".encrypt" do 

    it "returns the same character if the shift value is 0" do 

      inputs_and_outputs = { ["A", 0] => "A", ["Q", 0] => "Q"}

      inputs_and_outputs.each do |input, output|
        expected = output
        actual = caesar_cipher.encrypt(input[0], input[1])
        expect(actual).to eq(expected)
      end
    end

    it "returns the correct encrypted letter when the shift value is greater than 0" do 

      inputs_and_outputs = { ["A", 4] => "E", ["B", 2] => "D",  
        ["a", 1] => "b", ["b", 3] => "e"}

      inputs_and_outputs.each do |input, output|
        expected = output
        actual = caesar_cipher.encrypt(input[0], input[1])
        expect(actual).to eq(expected)
      end
    end

    it "returns the correct encrypted letter when the shift value is greater than 26" do 

      inputs_and_outputs = { ["A", 27] => "B", ["B", 80] => "D"}
      expected = "B"
      actual = caesar_cipher.encrypt("A", 27)
      expect(actual).to eq(expected)
    end

    it "returns an encrypted letter that wraps around the alphabet" do 

      inputs_and_outputs = { ["z", 3] => 'c', ["Y", 5] => "D", ["x", 81] => "a", ["Z", 5] => "E" }

      inputs_and_outputs.each do |input, output|
        expected = output
        actual = caesar_cipher.encrypt(input[0], input[1])
        expect(actual).to eq(expected)
      end
    end


    it "returns the same value if the character is a special character" do 

      inputs_and_outputs = { ["!", 5] => "!", ["$", 7] => "$"}

      inputs_and_outputs.each do |input, output|
        expected = output
        actual = caesar_cipher.encrypt(input[0], input[1])
        expect(actual).to eq(expected)
      end
    end


    it "encrypts a string of characters" do 

      inputs_and_outputs = { ["WHat. a string!" , 5] => "BMfy. f xywnsl!", ["4530", 5] => "4530", ["Hello@World", 12] => "Tqxxa@Iadxp"}

      inputs_and_outputs.each do |input, output|
        expected = output
        actual = caesar_cipher.encrypt(input[0], input[1])
        expect(actual).to eq(expected)
      end
    end
  end
end
