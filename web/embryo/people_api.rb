module Embryo
  # The API allows you to create, delete, and update people. You can retrieve individual persons as well as a list
  # of all people.
  class PeopleAPI < Grape::API
    include Grape::Kaminari
    include Grape::ResponseHelpers

    version 'v1', using: :header, vendor: 'embryo', format: :json, strict: true

    desc 'Create a person' do
      detail 'Creates a new person object.'
    end
    params do
      requires :name, type: String, desc: 'The name of the person.'
      requires :born_at, type: DateTime, desc: 'The date of birth of the person.'
    end
    post '/people' do
      Operations::People::CreatePerson.new.call(declared(params)) do |on|
        on.success { |person| person }
        on.failure { |errors| errors!(errors, status_code: 422) }
      end
    end

    desc 'Retrieve a person' do
      detail 'Retrieves the details of an existing person. You need only supply the unique person identifier that
              was returned upon person creation.'
    end
    params do
      requires :id, type: Integer, desc: 'The ID of the person.'
    end
    get '/people/:id' do
      Operations::People::FindPerson.new.call(params[:id]) do |on|
        on.success { |person| person }
        on.failure { |errors| errors!(errors, status_code: 404) }
      end
    end

    desc 'Update a person'
    params do
      requires :id, type: Integer, desc: 'The ID of the person.'
      optional :name, type: String, desc: 'The name of the person.'
      optional :born_at, type: DateTime, desc: 'The date of birth of the person.'
    end
    put '/people/:id' do
      person_attributes = declared(params, include_missing: false)

      Operations::People::UpdatePerson.new.call(params[:id], person_attributes) do |on|
        on.success { |person| person }
        on.failure(:not_found)   { |errors| errors!(errors, status_code: 404) }
        on.failure(:not_updated) { |errors| errors!(errors, status_code: 422) }
      end
    end

    desc 'Delete a person'
    params do
      requires :id, type: Integer, desc: 'The ID of the person.'
    end
    delete '/people/:id' do
      Operations::People::DeletePerson.new.call(params[:id]) do |on|
        on.success { body false }
        on.failure { |errors| errors!(errors, status_code: 422) }
      end
    end

    desc 'List all people' do
      detail 'Returns a list of your people. People are returned sorted by creation date, with the most recent
              people appearing last.'
    end
    params do
      optional :sort, type: Params::Sort, desc: 'The sort fields and directions.'
    end
    paginate
    get '/people' do
      paginate Person.all.order(params[:sort].to_s)
    end
  end
end
