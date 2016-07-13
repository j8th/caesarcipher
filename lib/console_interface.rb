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
    @wrapperio.puts_string("What value would you like your phrase to be encrypted by? ")
    shift_value = get_shift_value
    @wrapperio.puts_string(CaesarCipher.encrypt(user_input, shift_value))
  end

  def get_shift_value
    begin
    shift_value = @wrapperio.get_action
    @wrapperio.puts_string("Please enter an integer") unless shift_value.is_a? Integer
    end while not shift_value.is_a? Integer
    shift_value.to_i
  end

end

