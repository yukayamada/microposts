class AddLessonAtToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :lesson_at, :date
  end
end
