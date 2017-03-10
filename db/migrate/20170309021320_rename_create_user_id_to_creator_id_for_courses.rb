class RenameCreateUserIdToCreatorIdForCourses < ActiveRecord::Migration[5.0]
  def change
    rename_column :courses, :create_user_id, :creator_id
  end
end
