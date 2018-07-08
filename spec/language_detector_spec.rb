require 'spec_helper'
require_relative '../language_detector.rb'
require_relative '../env.rb'

describe LanguageDetector do
  describe '#call' do
    let(:input) { 'this is an english text' }
    let(:payload) do
      {
        q: input,
        key: Env.api_key
      }
    end

    before { allow_any_instance_of(LanguageDetector).to receive(:parse_response) }

    it 'uses the correct payload' do
      expect(RestClient).to receive(:post).with(LanguageDetector::URL, payload)

      described_class.new.call(input)
    end
  end
end
