RSpec.describe Embryo::Schemas::People::Update do
  let(:validate_person_update) { subject }

  describe '#call' do
    context 'when the input is valid' do
      let(:person_attributes) { { name: 'Big Brother', born_at: '04/04/1984' } }

      it 'is successful' do
        result = validate_person_update.(person_attributes)
        expect(result).to be_success
      end
    end

    context 'when the name is absent' do
      let(:person_attributes) { { born_at: '04/04/1984' } }

      it 'returns a hash with error messages' do
        result = validate_person_update.(person_attributes)
        expect(result).to have_error_message('name is missing')
      end
    end

    context 'when the name is present, but too long' do
      let(:person_attributes) { { name: 'Big Brother' * 7, born_at: '04/04/1984' } }

      it 'returns a hash with error messages' do
        result = validate_person_update.(person_attributes)
        expect(result).to have_error_message('name size cannot be greater than 70')
      end
    end
  end
end
