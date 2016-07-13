module CaesarCipher

  module Alpha 

    UPPERCASE_RANGE = ("A".."Z")
    LOWERCASE_RANGE = ("a".."z")

    def reindex(value)
      value % 26
    end

    def upcase?(char)
      UPPERCASE_RANGE.include?(char)
    end

    def letter?(char)
      UPPERCASE_RANGE.include?(char) || LOWERCASE_RANGE.include?(char)
    end

    def start_ascii(char)
      upcase?(char) ? UPPERCASE_RANGE.first : LOWERCASE_RANGE.first
    end
  end
end
