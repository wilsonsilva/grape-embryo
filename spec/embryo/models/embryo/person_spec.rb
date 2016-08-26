require 'spec_helper'

describe Embryo::Person, type: :model do
  it { is_expected.to belong_to(:gender) }
end
