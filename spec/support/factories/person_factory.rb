# FactoryGirl.define do
#   factory :person, class: 'Embryo::Person' do
#     name 'Wilson Silva'
#     born_at '15/11/1990'
#   end
# end

RomFactory::Builder.define do |b|
  b.factory(relation: :people, name: :person) do |f|
    f.name 'Wilson Silva'
    f.born_at '15/11/1990'
    f.created_at { Time.now }
    f.updated_at { Time.now }
  end
end
