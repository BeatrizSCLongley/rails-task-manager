class CreateTaskManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :task_managers do |t|
      t.string :title
      t.text :details
      t.boolean :completed

      t.timestamps
    end
  end
end
