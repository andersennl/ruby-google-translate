require_relative './translator.rb'

class Client
  def self.translate(input)
    Translator.call(input)
  end
end

input = ARGV[0]
p Client.translate(input)
