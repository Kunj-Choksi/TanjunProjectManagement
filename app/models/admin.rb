class Admin < ApplicationRecord
  has_secure_password
  has_many :developers, class_name: "Developer", foreign_key: :created_by_id
  has_many :projects, class_name: "Project", foreign_key: :created_by_id

  enum status: { active: 'active', inactive: 'inactive' }

  def as_json
    result = {}
    result['first_name'] = first_name
    result['last_name'] = last_name
    result['email'] = email
    result['status'] = status

    result
  end
end
