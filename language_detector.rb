require 'rest-client'
require_relative './env.rb'
require_relative './language_parser.rb'

class LanguageDetector
  URL = 'https://translation.googleapis.com/language/translate/v2/detect'.freeze

  def call(input)
    payload = {
      q: input,
      key: Env.api_key
    }

    result = RestClient.post(URL, payload)
    parse_response(result)
  end

  private

  def parse_response(result)
    LanguageParser.new.call(result)
  end
end
