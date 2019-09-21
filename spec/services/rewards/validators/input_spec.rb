# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rewards::Validators::Input do
  describe '.valid?' do
    subject { validator.valid? }
    let(:validator) { described_class.new(data) }

    context 'success' do
      context 'valid string given' do
        let(:data) do
          <<-REWARD
            2018-06-12 09:41 A recommends B
            2018-06-14 09:41 B accepts
            2018-06-16 09:41 B recommends C
          REWARD
        end

        it { expect(subject).to eq(true) }
      end

      context 'multiple recommendations' do
        let(:data) do
          <<-REWARD
            2018-06-12 09:41 A recommends B
            2018-06-13 09:41 B recommends C
            2018-06-13 09:46 C recommends D
            2018-06-14 09:50 B accepts
            2018-06-14 09:51 C accepts
            2018-06-14 09:55 D accepts
          REWARD
        end

        it { expect(subject).to eq(true) }
      end

      context 'valid time sequence' do
        let(:data) do
          <<-REWARD
            2018-06-12 09:41 A recommends B
            2018-06-13 09:41 B recommends C
            2018-06-13 09:46 C recommends D
            2018-06-14 09:50 B accepts
            2018-06-14 09:51 C accepts
            2018-06-14 09:55 D accepts
          REWARD
        end

        it { expect(subject).to eq(true) }
      end
    end

    context 'failure' do
      context 'invalid dates' do
        let(:data) do
          <<-REWARD
            20118-06-12 09:41 A recommends B
            2018-06-13 09:41 B recommends C
          REWARD
        end

        it { expect(subject).to eq(false) }
        it { expect { subject }.to change { validator.errors[:date].count }.by(1) }
      end

      context 'blank input' do
        let(:data) {}

        it { expect(subject).to eq(false) }
        it { expect { subject }.to change { validator.errors[:data].count }.by(1) }
      end

      context 'invalid action' do
        let(:data) do
          <<-REWARD
            2018-06-12 09:41 A does C
          REWARD
        end

        it { expect(subject).to eq(false) }
        it { expect { subject }.to change { validator.errors[:action].count }.by(1) }
      end

      context 'invalid recommends' do
        let(:data) do
          <<-REWARD
            2018-06-12 09:41 A recommends
          REWARD
        end

        it { expect(subject).to eq(false) }
        it { expect { subject }.to change { validator.errors[:action].count }.by(1) }
      end

      context 'invalid accepts' do
        let(:data) do
          <<-REWARD
            2018-06-12 09:41 B accepts C
          REWARD
        end

        it { expect(subject).to eq(false) }
        it { expect { subject }.to change { validator.errors[:action].count }.by(1) }
      end

      context 'invalid timesequence' do
        let(:data) do
          <<-REWARD
            2018-06-12 09:41 B recommends C
            2018-03-12 09:41 C recommends D
          REWARD
        end

        it { expect(subject).to eq(false) }
        it { expect { subject }.to change { validator.errors[:date].count }.by(1) }
      end
    end
  end
end
