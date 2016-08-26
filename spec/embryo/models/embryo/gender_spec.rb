require 'spec_helper'

describe Embryo::Gender, type: :model do
  it { is_expected.to have_many(:person) }
end
