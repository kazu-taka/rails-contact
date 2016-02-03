class CreateContactkinds < ActiveRecord::Migration
  def change
    create_table :contactkinds do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
