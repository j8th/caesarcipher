require_relative "alpha"
include Alpha

class CaesarCipher 

  class << self
    def encrypt(user_input, shift_value)
      user_input.each_char.map {|ch| encrypt_char(ch, shift_value)}.join()
    end

    private 

    def encrypt_char(char, shift_value)
      return char unless letter?(char)
      shift_value = reindex(shift_value)
      shift_letter(char, shift_value, start_ascii(char))
    end

    def shift_letter(char, shift_value, start_ascii)
      encrypt_value = (char.ord - (start_ascii.ord - 1)) + shift_value
      encrypt_value -= 26 if encrypt_value > 26
      (encrypt_value + (start_ascii.ord - 1)).chr
    end
  end
end
