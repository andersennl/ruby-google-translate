require 'spec_helper'
require_relative '../client.rb'
require_relative '../env.rb'
require_relative '../translator.rb'

describe Client do
  let(:input) { 'Das ist ein deutscher Text' }
  let(:target) { 'en' }
  let(:api_key) { Env.api_key }
  let(:payload) do
    {
      q: input,
      target: target,
      key: api_key
    }
  end

  it 'makes the translation request' do
    expect(Translator).to receive(:post).with(Translator::URL, payload)

    described_class.translate(input)
  end
end
