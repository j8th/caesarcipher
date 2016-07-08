class CaesarCipher 

  def encrypt(user_input, shift_value)
    encrypted_string = ""
    user_input.each_char {|ch| 
      encrypted_string += encrypt_char(ch, shift_value)
    }
    encrypted_string
  end

  private 

  def encrypt_char(char, shift_value)
    unless letter?(char)
      return char
    end
    shift_value = reindex(shift_value)
    if upcase?(char)
      return shift_letter(char, shift_value, "A")
    else
      return shift_letter(char, shift_value, "a")
    end
  end

  def reindex(value)
    value % 26
  end

  def shift_letter(char, shift_value, start_ascii)
    encrypt_value = (char.ord - (start_ascii.ord - 1)) + shift_value
    encrypt_value -= 26 if encrypt_value > 26
    return (encrypt_value + (start_ascii.ord - 1)).chr
  end

  def upcase?(char)
    uppercase_range = ("A".."Z")
    uppercase_range.include?(char)
  end

  def letter?(char)
    uppercase_range = ("A".."Z")
    lowercase_range = ("a".."z")
    uppercase_range.include?(char) || lowercase_range.include?(char)
  end


end
