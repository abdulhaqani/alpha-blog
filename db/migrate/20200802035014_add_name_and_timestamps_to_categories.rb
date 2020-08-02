class AddNameAndTimestampsToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :name, :string
    add_timestamps :categories, null: false
  end
end
