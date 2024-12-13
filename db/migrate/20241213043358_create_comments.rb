class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :creator
      t.text :content
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
