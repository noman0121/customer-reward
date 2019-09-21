# frozen_string_literal: true

module Rewards
  class Main
    attr_reader :data, :validator, :errors, :calculator

    delegate :errors, :invalid?, to: :validator
    delegate :calculate, to: :calculator

    def initialize(data)
      @data = data
      @validator = Validators::Input.new(data)
      @formatter = Formatter.new(data)
      @calculator = Rewards::Calculator.new(@formatter.sorted_rows)
    end
  end
end
