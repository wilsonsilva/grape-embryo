require 'spec_helper'

RSpec.describe Embryo::Operations::People::DeletePerson do
  subject(:delete_person) { described_class.new }

  describe '#call' do
    context 'when the person exists' do
      let!(:person) { create :person }

      it 'deletes a person' do
        expect { delete_person.(person.id) }.to change { Embryo::Person.count }.to(0)
      end

      it 'is a success' do
        result = delete_person.(person.id)

        expect(result).to be_success
      end
    end

    context 'when the person does not exist' do
      let(:inexistent_person_id) { 1984 }

      it 'does not delete a person' do
        expect { delete_person.(inexistent_person_id) }.not_to change { Embryo::Person.count }
      end

      it 'is a success' do
        result = delete_person.(inexistent_person_id)

        expect(result.value).to eq(true)
        expect(result).to be_success
      end
    end

    context 'when there is an error' do
      let(:not_destroyed_exception) { ActiveRecord::ActiveRecordError.new('') }
      let(:arbitrary_person_id)     { 1984 }

      before { allow(Embryo::Person).to receive(:delete).and_raise(not_destroyed_exception) }

      it 'is a failure' do
        result = delete_person.(arbitrary_person_id)

        expect(result).to be_failure
      end
    end
  end
end
