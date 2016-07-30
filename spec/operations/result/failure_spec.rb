require 'spec_helper'

RSpec.describe Operations::Result::Failure do
  subject { described_class.new(value: double, code: double) }

  it { is_expected.to be_failure }
  it { is_expected.not_to be_success }
end
