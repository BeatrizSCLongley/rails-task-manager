class AddDefaultToActiveRecord < ActiveRecord::Migration[6.0]
  def change
    change_column(:task_managers, :completed, :boolean, default: false)
  end
end
