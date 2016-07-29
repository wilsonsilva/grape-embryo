require 'spec_helper'

RSpec.describe Operations::Result::Success do
  subject { described_class.new(value: double) }

  it { is_expected.to be_success }
  it { is_expected.not_to be_failure }
end
