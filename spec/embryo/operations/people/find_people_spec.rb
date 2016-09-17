require 'spec_helper'

RSpec.describe Embryo::Operations::People::FindPeople do
  subject(:find_people) { described_class.new }

  describe '#call' do
    let(:people_repo) { Embryo::Repositories::PeopleRepo.new(ROMConnection) }

    context 'when the operation succeeds' do
      let!(:big_brother) { create(:person, name: 'Big Brother', born_at: '04/04/1984') }
      let!(:salazar)     { create(:person, name: 'Salazar', born_at: '25/04/1974') }
      let!(:sort_order)  { Params::Sort.parse('name:asc') }

      it 'finds people' do
        result = find_people.(sort_order)

        expect(result.value).to include(big_brother, salazar)
      end

      it 'is a success' do
        result = find_people.(sort_order)

        expect(result).to be_success
      end
    end

    context 'when there is an error' do
      let(:database_exception)  { Sequel::Error.new('') }
      let(:arbitrary_person_id) { 1984 }
      let(:repo_double)         { instance_double(Embryo::Repositories::PeopleRepo) }

      before do
        allow(Embryo::Repositories::PeopleRepo).to receive(:new).and_return(repo_double)
        allow(repo_double).to receive(:all_sorted_by).and_raise(database_exception)
      end

      it 'is a failure' do
        result = find_people.(arbitrary_person_id)

        expect(result).to be_failure
      end
    end
  end
end
