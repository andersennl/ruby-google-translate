require 'rest-client'
require_relative './env.rb'
require_relative './language_detector.rb'
require 'json'
require 'htmlentities'

class Translator
  URL = 'https://translation.googleapis.com/language/translate/v2'.freeze

  def call(input)
    payload = {
      q: input,
      target: target_language(input),
      key: $API_KEY#Env.api_key
    }

    post(URL, payload)
  end

  def post(url, payload)
    result = RestClient.post(url, payload)
     HTMLEntities.new.decode JSON.parse(result.body)['data']['translations'][0]['translatedText']
  end

  def target_language(input)
    case source_language(input)
    when 'de'
      'en'
    else 'de'
    end
  end

  def source_language(input)
    LanguageDetector.new.call(input)
  end
end
