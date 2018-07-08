require 'rest-client'
require_relative './env.rb'
require_relative './language_detector.rb'
require_relative './translation_parser.rb'

class Translator
  URL = 'https://translation.googleapis.com/language/translate/v2'.freeze

  def call(input)
    payload = {
      q: input,
      target: target_language(input),
      key: Env.api_key
    }

    post(URL, payload)
  end

  private

  def post(url, payload)
    result = RestClient.post(url, payload)
    parse_result(result)
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

  def parse_result(result)
    TranslationParser.new.call(result)
  end
end
