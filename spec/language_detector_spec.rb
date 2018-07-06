require "spec_helper"
require_relative "../language_detector.rb"
require_relative "../env.rb"

describe LanguageDetector do
  describe "#call" do
    let(:input) { "this is an english text" }
    let(:payload) do
      {
        q: input,
        key: Env.api_key
      }
    end

    it "uses the correct payload" do
      expect(RestClient).to receive(:post).with(LanguageDetector::URL, payload)

      described_class.call(input)
    end
  end
end