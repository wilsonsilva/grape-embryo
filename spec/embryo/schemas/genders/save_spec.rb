RSpec.describe Embryo::Schemas::Genders::Save do
  let(:validate_gender_persistence) { subject }

  describe '#call' do
    context 'when the input is valid' do
      let(:gender_attributes) { { name: 'Non-binary' } }

      it 'is successful' do
        result = validate_gender_persistence.(gender_attributes)
        expect(result).to be_success
      end
    end

    context 'when the name is absent' do
      let(:gender_attributes) { {} }

      it 'returns a hash with error messages' do
        result = validate_gender_persistence.(gender_attributes)
        expect(result).to have_error_message('name is missing')
      end
    end

    context 'when the name is blank' do
      let(:gender_attributes) { { name: nil } }

      it 'returns a hash with error messages' do
        result = validate_gender_persistence.(gender_attributes)
        expect(result).to have_error_message('name must be filled')
      end
    end
  end
end
