class CreateDevelopers < ActiveRecord::Migration[7.0]
  def change
    create_table :developers do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false
      t.string :status
      t.string :password_digest

      t.references :created_by, foreign_key: { to_table: :admins }

      t.timestamps
    end
  end
end
