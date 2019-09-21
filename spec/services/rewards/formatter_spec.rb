# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rewards::Formatter do
  describe '.formatted_rows' do
    subject { formatter.formatted_rows }
    let(:formatter) { described_class.new(data) }

    context 'returns Array#FormattedRow' do
      let(:data) do
        <<-REWARD
          2018-06-12 09:41 A recommends B
          2018-06-14 09:41 B accepts
          2018-06-16 09:41 B recommends C
        REWARD
      end

      it { expect(subject.size).to eq(3) }
      it { expect(subject.first.class).to eq(Rewards::FormattedRow) }
    end
  end
end
