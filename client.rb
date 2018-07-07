require_relative './translator.rb'

class Client
  def self.translate(input)
    Translator.call(input)
  end
end

input = ARGV.join(" ")
puts Client.translate(input)
