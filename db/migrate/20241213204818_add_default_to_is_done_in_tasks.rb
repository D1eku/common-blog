class AddDefaultToIsDoneInTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_default :tasks, :is_done, from: nil, to: false
  end
end
