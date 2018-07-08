require 'rest-client'
require 'json'
require_relative './env.rb'

class LanguageDetector
  URL = 'https://translation.googleapis.com/language/translate/v2/detect'.freeze

  def call(input)
    payload = {
      q: input,
      key: $API_KEY#Env.api_key
    }

    result = RestClient.post(URL, payload)
    JSON.parse(result.body)['data']['detections'][0][0]['language']
  end
end
