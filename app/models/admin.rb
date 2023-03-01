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
    result['first_name'] = first_name
    result['last_name'] = last_name
    result['email'] = email
    result['status'] = status

    result
  end
end
