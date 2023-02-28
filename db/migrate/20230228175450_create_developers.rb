class CreateDevelopers < ActiveRecord::Migration[7.0]
  def change
    create_table :developers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :status
      t.string :password_digest

      t.references :created_by, foreign_key: { to_table: :admins }

      t.timestamps
    end
  end
end
