require 'spec_helper'

RSpec.describe Embryo::Operations::People::FindPerson do
  subject(:find_person) { described_class.new }

  describe '#call' do
    context 'when the person exists' do
      let!(:person) { create :person }

      it 'finds a person' do
        result = find_person.(person.id)

        expect(result.value).to eq(person)
      end

      it 'is a success' do
        result = find_person.(person.id)

        expect(result).to be_success
      end
    end

    context 'when the person does not exist' do
      let(:inexistent_person_id) { 1984 }

      it 'returns an error message and an error code' do
        result = find_person.(inexistent_person_id)

        expect(result.value).to eq("Could not find person with id #{inexistent_person_id}")
      end

      it 'is a failure' do
        result = find_person.(inexistent_person_id)

        expect(result).to be_failure
      end
    end

    context 'when there is an error' do
      let(:database_exception)  { ActiveRecord::ActiveRecordError.new('') }
      let(:arbitrary_person_id) { 1984 }

      before { allow(Embryo::Person).to receive(:find_by_id).and_raise(database_exception) }

      it 'is a failure' do
        result = find_person.(arbitrary_person_id)

        expect(result).to be_failure
      end
    end
  end
end
