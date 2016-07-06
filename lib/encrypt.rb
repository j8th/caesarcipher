class Encrypt

  def uppercase_letters_in_string(string)
    uppercase_letters = []
    (0...string.length).each do |index|
      uppercase_letters << index if (string[index].ord >= 65 && string[index].ord <= 90)
    end
    uppercase_letters
  end

  def convert_string_to_numeric_rep(string)
    string = string.downcase
    character_list = string.split("")
    numeric_rep_list = []
    character_list.each do |ch|
      if (ch.ord >= 0 && ch.ord <= 64) || (ch.ord >= 91 && ch.ord <= 96) || (ch.ord >= 123 && ch.ord <= 126)
        numeric_rep_list << ch
      else  
        numeric_rep_list << ch.ord - "a".ord + 1
      end
    end
    numeric_rep_list
  end

  def shift(numeric_list, shift_value)
    shifted_list = []
    numeric_list.each do |item|
      if item.is_a? String
        shifted_list << item 
      else  
        sum = item + shift_value
        while sum > 26 do
          sum -= 26
        end
        shifted_list << sum
      end
    end
    shifted_list
  end

  def convert_numeric_rep_to_alpha(numeric_list)
    letter_list = []
    numeric_list.each do |item|
      if item.is_a? String
        letter_list << item 
      else
        ascii_rep = 96 + item
        letter_list << ascii_rep.chr
      end
    end
    letter_list
  end

  def convert_letters_to_uppercase(alpha_list, uppercase_index_list)
    # return alpha_list if uppercase_index_list == []
    # should this method have error checking? ex: if the specified index is larger than the length of the string
    # or the specified index is a special character 
    for item in uppercase_index_list 
      alpha_list[item].upcase!
    end
    alpha_list
  end

  def encrypt_input(string, shift_value)
    uppercase_letters_list = uppercase_letters_in_string(string)
    number_rep_list = convert_string_to_numeric_rep(string)
    number_rep_list_shifted = shift(number_rep_list, shift_value)
    encrypted_list = convert_numeric_rep_to_alpha(number_rep_list_shifted)
    encrypted_list = convert_letters_to_uppercase(encrypted_list, uppercase_letters_list)
    encrypted_list.join("")
  end

  def run
    puts "What phrase would you like to encrypt?"
    user_input_string = gets.chomp
    puts "What value would you like it to shift by?"
    user_input_shift_value = gets.chomp
    encrypt_input(user_input_string, user_input_shift_value)
  end


end
