# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rewards::FormattedRow do
  describe '.initialize' do
    let(:row) { '2018-06-12 09:41 A recommends B' }
    subject { described_class.new(row) }

    context 'attrs correct' do
      it { expect(subject.date).to be_kind_of(Time) }
      it { expect(subject.recommends?).to eq(true) }
      it { expect(subject.from).to eq('A') }
      it { expect(subject.to).to eq('B') }
    end
  end

  describe '.compare' do
    subject { formatted <=> other }
    let(:formatted) { described_class.new('2018-06-12 09:41 A recommends B') }
    let(:other) { described_class.new('2018-06-14 10:42 B recommends C') }

    it { expect(subject).to eq(-1) }
  end
end
