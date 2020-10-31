class AddInputsToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :inputs, :string
    add_column :tasks, :outputs, :string
  end
end
