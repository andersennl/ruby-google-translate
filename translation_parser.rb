require 'json'
require 'htmlentities'

class TranslationParser
  def call(result)
    html_response = JSON.parse(result.body)
    text = html_response['data']['translations'][0]['translatedText']
    HTMLEntities.new.decode(text)
  end
end
