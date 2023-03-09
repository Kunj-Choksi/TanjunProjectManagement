class Admin < ApplicationRecord
  has_secure_password
  has_many :developers, class_name: 'Developer', foreign_key: :created_by_id
  has_many :projects, class_name: 'Project', foreign_key: :created_by_id

  enum status: { active: 'active', inactive: 'inactive' }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/

  def as_json
    result = {}
    result['id'] = id
    result['first_name'] = first_name
    result['last_name'] = last_name
    result['email'] = email
    result['status'] = status

    result
  end

  def own_this_project(project_id)
    p = Project.find(project_id)

    p.created_by_id == self.id
  end

  def own_this_developer(developer_id)
    d = Developer.find(developer_id)

    d.created_by_id == self.id
  end
end
