require_relative "alpha"


module CaesarCipher 

  include Alpha



  def encrypt(user_input, shift_value)
    @user_input = user_input
    @shift_value = shift_value
    @user_input.each_char.map {|ch| encrypt_char(ch)}.join()
  end

  private 

  def encrypt_char(char)
    return char unless letter?(char)
    @shift_value = reindex(@shift_value)
    shift_letter(char, start_ascii(char))
  end

  def shift_letter(char, start_ascii)
    encrypt_value = (char.ord - (start_ascii.ord - 1)) + @shift_value
    encrypt_value -= 26 if encrypt_value > 26
    (encrypt_value + (start_ascii.ord - 1)).chr
  end
end
