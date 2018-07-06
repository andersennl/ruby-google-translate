require_relative './env.rb'

class PayloadCreator
  def self.call(input)
    {
      q: input,
      key: Env.api_key
    }
  end
end
