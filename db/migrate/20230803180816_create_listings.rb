class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
