require 'spec_helper'

describe Embryo::Gender, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_many(:person) }
end
