class ProjectDeveloper < ApplicationRecord
  belongs_to :project
  belongs_to :developer

  validates :project_id, presence: true
  validates :developer_id, presence: true
  validates :added_by_id, presence: true
  validates :added_on, presence: true

  enum status: { active: 'active', inactive: 'inactive' }
end
