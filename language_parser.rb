require 'json'

class LanguageParser
  def call(result)
    JSON.parse(result.body)['data']['detections'][0][0]['language']
  end
end
