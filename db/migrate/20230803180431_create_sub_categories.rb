# frozen_string_literal: true

class CreateSubCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end
