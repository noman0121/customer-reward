# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rewards::Node do
  describe '#initialize' do
    it 'returns Node object' do
      node = described_class.new('A')
      expect(node.value).to eq 'A'
      expect(node.points).to eq 0
    end
  end
end
