require 'spec_helper'

describe Embryo::Person, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:born_at) }
  it { is_expected.to belong_to(:gender) }
end
