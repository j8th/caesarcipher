require "interface"

describe Interface do 
  let(:wrapper){ double }
  let(:interface_test) { Interface.new(wrapper)}


  describe ".run" do 
    it "asks the user what phrase they would like to encrypt and by what value" do 
      expect(:wrapper).to receive(:puts_string).exactly(3).times
      expect(:wrapper).to receive(:get_action).with("Hello World", 5)
      interface_test.run
    end
  end


end