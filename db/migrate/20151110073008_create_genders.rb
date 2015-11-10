# Creates the genders table
class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.string :name, null: false
    end
  end
end
