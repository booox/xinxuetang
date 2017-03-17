class AddPostIdToAssignmnets < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :post_id, :integer
  end
end
