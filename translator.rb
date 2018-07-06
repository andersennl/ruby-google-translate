require 'rest-client'
require_relative './env.rb'
require_relative './language_detector.rb'
require 'json'

class Translator
  URL = 'https://translation.googleapis.com/language/translate/v2'.freeze

  def self.call(input)
    payload = {
      q: input,
      target: target_language(input),
      key: Env.api_key
    }

    post(URL, payload)
  end

  def self.post(url, payload)
    result = RestClient.post(url, payload)
    JSON.parse(result.body)['data']['translations'][0]['translatedText']
  end

  def self.target_language(input)
    LanguageDetector.call(input)
  end
end
