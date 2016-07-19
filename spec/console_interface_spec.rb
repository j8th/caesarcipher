require "console_interface"

include CaesarCipher

describe ConsoleInterface do 

  let(:mockio){ double }
  let(:console_interface_test) { ConsoleInterface.new(mockio)}


  describe ".run" do 

    context "the user enters an integer for their shift value" do 
      
      it "asks the user what phrase they would like to encrypt and by what value" do 
        expect(mockio).to receive(:puts_string).exactly(3).times
        expect(mockio).to receive(:get_action).and_return("Hello World", "5")
        console_interface_test.run
      end
    end

    context "the user doesn't enter an integer for their shift value" do 
 
      it "prompts the user to enter their shift value again" do
        expect(mockio).to receive(:puts_string).exactly(4).times
        expect(mockio).to receive(:get_action).and_return("Hello", "five", "3")
        console_interface_test.run
      end
    end
  end
end