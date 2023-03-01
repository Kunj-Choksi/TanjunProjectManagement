class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :status
      t.references :created_by, foreign_key: { to_table: :admins }

      t.timestamps
    end
  end
end
