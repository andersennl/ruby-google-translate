require_relative './translator.rb'

class Client
  def translate(input)
    Translator.new.call(input)
  end
end

input = ARGV.join(" ")
puts Client.new.translate(input)
