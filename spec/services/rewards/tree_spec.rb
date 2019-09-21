# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rewards::Tree do
  describe '#initialize' do
    it 'returns tree object' do
      tree = described_class.new('A')
      expect(tree).not_to be_nil
      expect(tree.mapping.keys).to eq []
    end
  end

  describe '.insert' do
    it 'inserts node to tree' do
      tree = described_class.new('Rewards')
      sub_node = tree.add_reward_node('A', 'B')
      expect(sub_node.parent.value).to eq 'A'
    end
  end

  describe '.add_points_to_parents' do
    it 'add points to 1 parent node' do
      tree = described_class.new('Rewards')
      tree.add_reward_node('A', 'B', accepts: true)
      expect(tree.points['A']).to eq 1
    end

    it 'add points to 2 parent nodes' do
      tree = described_class.new('Rewards')
      tree.add_reward_node('A', 'B', accepts: true)
      tree.add_reward_node('B', 'C', accepts: true)
      expect(tree.points['A']).to eq 1.5
    end

    it 'add points to 3 parent nodes' do
      tree = described_class.new('Rewards')
      tree.add_reward_node('A', 'B', accepts: true)
      tree.add_reward_node('B', 'C', accepts: true)
      tree.add_reward_node('C', 'D', accepts: true)
      expect(tree.points['A']).to eq 1.75
    end
  end
end
