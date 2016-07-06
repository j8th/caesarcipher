require "encrypt"

describe Encrypt do

  let(:encrypt){ Encrypt.new }

  #create more then one test case

  # it "returns the same character if the shift value is 0" do 

  #   inputs_and_outputs = { ["A", 0] => "A", ["Q", 0] => "Q"}

  #   inputs_and_outputs.each do |input, output|
  #     expected = output
  #     actual = encrypt.caesar_cipher(input[0], input[1])
  #     expect(actual).to eq(expected)
  #   end
  # end

  it "returns the encrypted letter based on the shift value" do 

    inputs_and_outputs = { ["A", 4] => "E", ["B", 2] => "D", ["A", 0] => "A", 
      ["a", 1] => "b", ["b", 3] => "e"}

    inputs_and_outputs.each do |input, output|
      expected = output
      actual = encrypt.caesar_cipher(input[0], input[1])
      expect(actual).to eq(expected)
    end
  end

  it "returns the same value if the character is a special character" do 

    inputs_and_outputs = { ["!", 5] => "!", ["$", 7] => "$"}

    inputs_and_outputs.each do |input, output|
      expected = output
      actual = encrypt.caesar_cipher(input[0], input[1])
      expect(actual).to eq(expected)
    end
  end

  # it "returns a lowercase encrypted letter based on the shift value if user input is lowercase" do 
    
  #   inputs_and_outputs = { ["a", 1] => "b", ["b", 3] => "e"}

  #   inputs_and_outputs.each do |input, output|
  #     expected = output
  #     actual = encrypt.caesar_cipher(input[0], input[1])
  #     expect(actual).to eq(expected)
  #   end
  # end

  it "returns an encrypted letter by a shift value from 1 to 26" do 

    expected = "B"
    actual = encrypt.caesar_cipher("A", 27)
    expect(actual).to eq(expected)
  end

  it "returns an encrypted letter that wraps around the alphabet" do 

    inputs_and_outputs = { ["z", 3] => 'c', ["Y", 5] => "D" }

    inputs_and_outputs.each do |input, output|
      expected = output
      actual = encrypt.caesar_cipher(input[0], input[1])
      expect(actual).to eq(expected)
    end
  end

  it "encrypts a string of characters" do 
    expected = "BMfy. f xywnsl!"
    actual = encrypt.caesar_cipher("WHat. a string!" , 5)
    expect(actual).to eq(expected)
  end

end
