class AddTasksListToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :tasks_list, null: false, foreign_key: true
  end
end
