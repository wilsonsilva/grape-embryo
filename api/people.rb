module Embryo
  # The API allows you to create, delete, and update people. You can retrieve individual persons as well as a list
  # of all people.
  class People < Grape::API
    version 'v1', using: :header, vendor: 'embryo', format: :json, strict: true

    desc 'Create a person'
    params do
      requires :name, type: String, desc: 'The name of the person.'
      requires :born_at, type: DateTime, desc: 'The date of birth of the person.'
    end
    post '/people' do
      Person.create!(declared(params))
    end

    desc 'Retrieve a person'
    params do
      requires :id, type: Integer, desc: 'The ID of the person.'
    end
    get '/people/:id' do
      Person.find(params[:id])
    end

    desc 'Update a person'
    params do
      requires :id, type: Integer, desc: 'The ID of the person.'
      optional :name, type: String, desc: 'The name of the person.'
      optional :born_at, type: DateTime, desc: 'The date of birth of the person.'
    end
    put '/people/:id' do
      person = Person.find(params[:id])

      person.update!(declared(params, include_missing: false))
      person
    end

    desc 'Delete a person'
    params do
      requires :id, type: Integer, desc: 'The ID of the person.'
    end
    delete '/people/:id' do
      Person.destroy(params[:id])

      status 204
    end

    desc 'List all people'
    get '/people' do
      Person.all
    end
  end
end
