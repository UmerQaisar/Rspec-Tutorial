class CreateLeaders < ActiveRecord::Migration[7.0]
  def change
    create_table :leaders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
