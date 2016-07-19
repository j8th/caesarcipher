require_relative "caesar_cipher"  

module CaesarCipher

  class ConsoleInterface 

    include CaesarCipher 

    def initialize (wrapper)
      @wrapperio = wrapper
    end

    def run
      @wrapperio.puts_string("What phrase would you like to encrypt? ")
      user_input = @wrapperio.get_action
      begin 
        @wrapperio.puts_string("What value would you like your phrase to be encrypted by? ") 
        shift_value = @wrapperio.get_action
      end while shift_value_num?(shift_value)
      shift_value = shift_value.to_i
      @wrapperio.puts_string(encrypt(user_input, shift_value))
    end

    private 

    def shift_value_num?(value)
      value !~ /^[0-9]+$/
    end
  end
end
