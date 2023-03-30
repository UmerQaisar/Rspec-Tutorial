class AddLeaderReferenceToGroup < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :leader
  end
end
