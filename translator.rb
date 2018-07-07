require 'rest-client'
require_relative './env.rb'
require_relative './language_detector.rb'
require 'json'
require 'htmlentities'

class Translator
  URL = 'https://translation.googleapis.com/language/translate/v2'.freeze

  def self.call(input)
    payload = {
      q: input,
      target: target_language(input),
      key: $API_KEY#Env.api_key
    }

    post(URL, payload)
  end

  def self.post(url, payload)
    result = RestClient.post(url, payload)
     HTMLEntities.new.decode JSON.parse(result.body)['data']['translations'][0]['translatedText']
  end

  def self.target_language(input)
    case source_language(input)
    when 'de'
      'en'
    else 'de'
    end
  end

  def self.source_language(input)
    LanguageDetector.call(input)
  end
end
