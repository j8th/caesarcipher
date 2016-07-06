require "encrypt"

describe "Encrypt" do 

  let(:encrypt) { Encrypt.new }

  describe ".uppercase_letters_in_string" do

    inputs_and_outputs = { "Hello World" => [0, 6], "What a string!" => [0], "hello world" => []}
    
    it "returns a list of the uppercase letters in the string" do 
      inputs_and_outputs.each do |input, output|
        expect(encrypt.uppercase_letters_in_string(input)).to eq(output)
      end
    end
  end

  describe ".convert_string_to_numeric_rep" do 

    it "returns a list of each letter in the string converted to it's alphabetical number" do
  
      inputs_and_outputs = {"Hello World" => [8, 5, 12, 12, 15, " ", 23, 15, 18, 12, 4], "stRing!" => [19, 20, 18, 9, 14, 7, "!"], "..." => [".", ".", "."]}
      
      inputs_and_outputs.each do |input, output|
        expect(encrypt.convert_string_to_numeric_rep(input)).to eq(output)
      end
    end
  end

  describe ".shift" do 

    it "returns a list of numbers increased by the shift value that correspond to their place in the alpahbet" do

      inputs_and_outputs = {[[8, 5, 12, 12, 15, " ", 23, 15, 18, 12, 4], 10] => [18, 15, 22, 22, 25, " ", 7, 25, 2, 22, 14], [[19, 20, 6, "!"], 35] => [2, 3, 15, "!"], [[".", ".", "."], 5] => [".", ".", "."]}

      inputs_and_outputs.each do |input, output|
        expect(encrypt.shift(input[0], input[1])).to eq(output)
      end
    end
  end

  describe ".convert_numeric_rep_to_alpha" do 

    it "converts a list of numbers (1 to 26) to its corresponding alphabetical character" do 
      
      inputs_and_outputs = {[18, 15, 22, 22, 25, " ", 7, 25, 2, 22, 14] => ["r", "o", "v", "v", "y", " ", "g", "y", "b", "v", "n"], [2, 3, 15, "!"] => ["b", "c", "o", "!"], [".", ".", "."] => [".", ".", "."]}
    
      inputs_and_outputs.each do |input, output|
        expect(encrypt.convert_numeric_rep_to_alpha(input)).to eq(output)
      end
    end
  end

  describe ".convert_letters_to_uppercase" do 

    it "converts specified lowercase letters into uppercase letters" do 

      inputs_and_outputs = {[ ["r", "o", "v", "v", "y", " ", "g", "y", "b", "v", "n"], [0, 7] ] => ["R", "o", "v", "v", "y", " ", "g", "Y", "b", "v", "n"], [ ["b", "c", "o", "!"], [0, 1, 2] ] => ["B", "C", "O", "!"], [ ["b", "c", "o", "!"], [] ] => ["b", "c", "o", "!"] }

      inputs_and_outputs.each do |input, output|
        expect(encrypt.convert_letters_to_uppercase(input[0], input[1])).to eq(output)
      end
    end
  end

  describe ".encrypt_input" do 

    it "encrypts a string" do 
      
      inputs_and_outputs = {["What a string!", 5] => "Bmfy f xywnsl!", ["Hello$ World", 13] => "Uryyb$ Jbeyq", ["...", 4] => "...", ["538", 5] => "538"}

      inputs_and_outputs.each do |input, output|
        expect(encrypt.encrypt_input(input[0], input[1])).to eq(output)
      end
    end
  end

  # describe ".run" do
  #   let(:user_string) { "What a string!"}
  #   let(:user_shift_value) { 5 }

  #   it "returns an encrypted version of the users input" do 
  #     encrypt.stub(:gets) {"What a string!"}
  #     expect(encrypt.run).to eq("What a string!")
  #     # encrypt.run.stub(:gets).and_return("What a string!")
  #   end
  # end

  

end
