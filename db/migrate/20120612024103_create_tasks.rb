class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.integer :user_id
      t.integer :priority
      t.datetime :limit_date

      t.timestamps
    end
  end
end
