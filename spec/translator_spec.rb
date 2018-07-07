require 'spec_helper'
require_relative '../translator.rb'
require_relative '../env.rb'

describe Translator do
  describe '#call' do
    let(:payload) do
      {
        q: input,
        target: target_language,
        key: Env.api_key
      }
    end

    before do
      allow(LanguageDetector).to receive(:call) { source_language }
      allow(JSON).to receive(:parse)
    end

    context 'with an english text' do
      let(:input) { 'this is an english text' }
      let(:source_language) { 'en' }
      let(:target_language) { 'de' }

      it 'posts the correct payload to google translation api' do
        expect(described_class).to receive(:post).with(Translator::URL, payload)

        described_class.call(input)
      end
    end

    context 'with a german text' do
      let(:input) { 'das ist ein deutscher text' }
      let(:source_language) { 'de' }
      let(:target_language) { 'en' }

      it 'posts the correct payload to google translation api' do
        expect(described_class).to receive(:post).with(Translator::URL, payload)

        described_class.call(input)
      end
    end
  end
end
