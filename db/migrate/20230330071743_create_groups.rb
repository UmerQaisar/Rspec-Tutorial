class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.string :size
      t.string :group_type

      t.timestamps
    end
  end
end
