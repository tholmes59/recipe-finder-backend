class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :recipe_title
      t.string :recipe_identifier
      t.string :recipe_image

      t.timestamps
    end
  end
end
