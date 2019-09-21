# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rewards::Calculator do
  describe '.calculate' do
    it 'calculates simple rewards' do
      str = <<-REWARD
        2018-06-12 09:41 A recommends B
        2018-06-14 09:41 B accepts
        2018-06-16 09:41 B recommends C
      REWARD
      rows = Rewards::Formatter.new(str).sorted_rows
      result = described_class.new(rows)
      expect(result.calculate).to eq('A' => 1)
    end

    it 'calculate complex rewards' do
      str = <<-REWARD
        2018-06-12 09:41 A recommends B
        2018-06-14 09:41 B accepts
        2018-06-16 09:41 B recommends C
        2018-06-17 09:41 C accepts
        2018-06-19 09:41 C recommends D
        2018-06-23 09:41 B recommends D
        2018-06-25 09:41 D accepts
      REWARD
      rows = Rewards::Formatter.new(str).sorted_rows
      result = described_class.new(rows)
      expect(result.calculate).to eq('A' => 1.75, 'B' => 1.5, 'C' => 1)
    end
  end
end
