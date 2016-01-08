class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.belongs_to :users, index: true
      t.belongs_to :creators, index: true
      t.string :name
      t.timestamps null: false
    end
  end
end
