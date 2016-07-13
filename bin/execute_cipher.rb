#!/usr/bin/env ruby

require_relative "../lib/console_interface"
require_relative "../lib/wrapperio"

cipher = CaesarCipher::ConsoleInterface.new(CaesarCipher::WrapperIO.new)
cipher.run