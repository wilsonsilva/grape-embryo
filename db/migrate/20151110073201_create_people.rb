# Creates the people table
class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.references :gender, index: true
      t.timestamp :born_at, null: false
      t.timestamps null: false
    end

    add_foreign_key :people, :genders
  end
end
