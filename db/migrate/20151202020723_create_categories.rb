class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.integer :category_id
    	t.integer :post_id
    	t.string :description

      t.timestamps
    end

    add_index :categories, :post_id
  end
end
