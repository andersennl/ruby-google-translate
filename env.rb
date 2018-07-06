require 'dotenv'
require 'pry'

class Env
  def self.api_key
    Dotenv.load['API_KEY']
  end
end