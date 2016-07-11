require_relative "wrapperIO"
require_relative "caesar_cipher"


class Interface 

  def initialize (wrapper)
    @wrapperio = WrapperIO.new
  end

  def run
    @wrapperio.puts_string("What phrase would you like to encrypt? ")
    user_input = @wrapperio.get_action
    @wrapperio.puts_string("What value would you like your phrase to be encrypted by? ")
    # condition to check if shift value is an intger 
    shift_value = @wrapperio.get_action
    puts(CaesarCipher.encrypt(user_input, shift_value))
  end

end

