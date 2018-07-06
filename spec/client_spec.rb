require 'spec_helper'
require_relative '../client.rb'
require_relative '../env.rb'

describe Client do
  it 'is loaded' do
    Env.api_key
  end
end
