require 'spec_helper'

RSpec.describe Operations::Result do
  describe '#code' do
    let!(:operation_result_code) { :insufficient_funds }

    it 'exposes the operation result code' do
      operation_result = described_class.new(value: double, code: operation_result_code)

      expect(operation_result.code).to eq(:insufficient_funds)
    end
  end

  describe '#value' do
    let!(:operation_result_value) { double }

    it 'exposes the operation result value' do
      operation_result = described_class.new(value: operation_result_value)

      expect(operation_result.value).to eq(operation_result_value)
    end
  end
end
