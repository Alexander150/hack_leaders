class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :login
      t.string :email
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end
