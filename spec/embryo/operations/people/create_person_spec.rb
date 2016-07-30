require 'spec_helper'

RSpec.describe Embryo::Operations::People::CreatePerson do
  subject(:create_person) { described_class.new }

  describe '#call' do
    context 'when the person attributes are valid' do
      let(:valid_attributes) { attributes_for(:person) }

      it 'creates a person' do
        expect { create_person.(valid_attributes) }.to change { Embryo::Person.count }.to(1)
      end

      it 'returns a person' do
        result = create_person.(valid_attributes)

        expect(result.value).to eq(Embryo::Person.first)
      end

      it 'is a success' do
        result = create_person.(valid_attributes)

        expect(result).to be_success
      end
    end

    context 'when the person attributes are invalid' do
      let(:invalid_attributes) { { naame: 'Boris' } }

      it 'does not create a person' do
        expect { create_person.(invalid_attributes) }.not_to change { Embryo::Person.count }
      end

      it 'returns an error code and an error message' do
        result = create_person.(invalid_attributes)

        expect(result.code).to eq(:not_created)
        expect(result.value).to eq("unknown attribute 'naame' for Embryo::Person.")
      end

      it 'is a failure' do
        result = create_person.(invalid_attributes)

        expect(result).to be_failure
      end
    end
  end
end
