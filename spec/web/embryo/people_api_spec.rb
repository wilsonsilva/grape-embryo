require 'spec_helper'

describe Embryo::PeopleAPI, type: :api do
  describe 'POST /people' do
    it 'creates a person' do
      post '/people', {name: 'Big Brother', born_at: '04/04/1984'}, 'HTTP_ACCEPT' => 'application/vnd.embryo-v1+json'

      expect_status(201)
      expect_json(name: 'Big Brother', born_at: '1984-04-04T00:00:00.000+00:00')
      expect(Embryo::Person.first).to have_attributes(name: 'Big Brother')
    end
  end

  describe 'GET /people/:id' do
    let(:person) { create(:person, name: 'Big Brother', born_at: '04/04/1984') }

    it 'retrieves a person' do
      get "/people/#{person.id}", 'HTTP_ACCEPT' => 'application/vnd.embryo-v1+json'

      expect_status(200)
      expect_json(name: 'Big Brother')
    end
  end

  describe 'PUT /people/:id' do
    let(:person) { create(:person, name: 'Big Brother', born_at: '04/04/1984') }

    it 'updates a person' do
      put "/people/#{person.id}", {name: 'Dr. Big Brother'}, 'HTTP_ACCEPT' => 'application/vnd.embryo-v1+json'

      expect_status(200)
      expect_json(name: 'Dr. Big Brother')
      expect(person.reload).to have_attributes(name: 'Dr. Big Brother')
    end
  end

  describe 'DELETE /people/:id' do
    let(:person) { create(:person, name: 'Big Brother', born_at: '04/04/1984') }

    it 'deletes a person' do
      delete "/people/#{person.id}", {}, 'HTTP_ACCEPT' => 'application/vnd.embryo-v1+json'

      expect_status(204)
      expect(response.body).to be_empty
      expect(Embryo::Person.where(id: person.id)).not_to exist
    end
  end

  describe 'GET /people' do
    let!(:big_brother) { create(:person, name: 'Big Brother', born_at: '04/04/1984') }
    let!(:salazar)     { create(:person, name: 'Salazar', born_at: '25/04/1974') }

    it 'lists all people' do
      get '/people', 'HTTP_ACCEPT' => 'application/vnd.embryo-v1+json'

      expect_status(200)
      expect_json('0', name: 'Big Brother')
      expect_json('1', name: 'Salazar')
      expect_json_sizes(2)
    end

    context 'with sort param' do
      it 'list the people ordered by birth date' do
        get '/people?sort=name:desc', 'HTTP_ACCEPT' => 'application/vnd.embryo-v1+json'

        expect_status(200)
        expect_json('0', name: 'Salazar')
        expect_json('1', name: 'Big Brother')
        expect_json_sizes(2)
      end
    end

    context 'when page is present' do
      it 'list paginated results' do
        get '/people?page=1', 'HTTP_ACCEPT' => 'application/vnd.embryo-v1+json'

        expect_header('X-Total', '2')
        expect_header('X-Total-Pages', '1')
        expect_header('X-Per-Page', '25')
        expect_header('X-Page', '1')
        expect_header('X-Next-Page', '')
        expect_header('X-Prev-Page', '')
        expect_header('X-Offset', '0')

        expect_status(200)

        expect_json('0', name: 'Big Brother')
        expect_json('1', name: 'Salazar')
        expect_json_sizes(2)
      end
    end
  end
end
