class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.integer :task_id
      t.string :inputs
      t.string :outputs

      t.timestamps
    end
    remove_column :tasks, :inputs, :string
    remove_column :tasks, :outputs, :string
    add_column :tasks, :start_point, :string
  end
end
