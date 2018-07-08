require "spec_helper"
require_relative "../payload_creator.rb"
require_relative "../env.rb"

describe PayloadCreator do
  let(:input) { "this is an english text" }
  let(:result) do
    {
      q: input,
      key: Env.api_key
    }
  end

  it "returns the correct payload" do
    expect(described_class.new.call(input)).to eq result
  end
end
