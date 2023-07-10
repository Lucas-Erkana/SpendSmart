class CreateJoinTableCategoriesEntities < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :entities do |t|
      t.index [:category_id, :entity_id]
    end
  end
end
