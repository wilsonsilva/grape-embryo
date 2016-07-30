require 'spec_helper'

RSpec.describe Embryo::Operations::People::UpdatePerson do
  subject(:update_person) { described_class.new }

  describe '#call' do
    context 'when the person exists' do
      let!(:person) { create :person, name: 'Big Brother', born_at: '04/04/1984' }

      context 'and the person attributes are valid' do
        let(:valid_attributes) { { name: 'Dr. Big Brother' } }

        it 'updates a person' do
          update_person.(person.id, valid_attributes)

          expect(person.reload.name).to eq('Dr. Big Brother')
        end

        it 'returns a person' do
          result = update_person.(person.id, valid_attributes)

          expect(result.value).to be_an_instance_of(Embryo::Person)
        end

        it 'is a success' do
          result = update_person.(person.id, valid_attributes)

          expect(result).to be_success
        end
      end

      context 'when the person attributes are invalid' do
        let(:invalid_attributes) { { naame: 'Boris' } }

        it 'does not update a person' do
          update_person.(person.id, invalid_attributes)

          expect(person.reload.name).to eq('Big Brother')
        end

        it 'returns an error code and an error message' do
          result = update_person.(person.id, invalid_attributes)

          expect(result.code).to eq(:not_updated)
          expect(result.value).to eq("unknown attribute 'naame' for Embryo::Person.")
        end

        it 'is a failure' do
          result = update_person.(person.id, invalid_attributes)

          expect(result).to be_failure
        end
      end
    end

    context 'when the person does not exist' do
    end
  end
end
