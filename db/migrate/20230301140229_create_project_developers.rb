class CreateProjectDevelopers < ActiveRecord::Migration[7.0]
  def change
    create_table :project_developers do |t|
      t.belongs_to :project
      t.belongs_to :developer
      t.references :added_by, foreign_key: { to_table: :admins }
      t.datetime :added_on
      t.datetime :removed_on
      t.string :status

      t.timestamps
    end
  end
end
