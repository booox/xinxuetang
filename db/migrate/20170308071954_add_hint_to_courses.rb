class AddHintToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :hint, :text
  end
end
