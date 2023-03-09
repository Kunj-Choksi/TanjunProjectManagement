class Developer < ApplicationRecord
  has_secure_password

  enum status: { active: 'active', inactive: 'inactive', initiated: 'initiated', onboarded: 'onboarded' }

  has_many :project_developers
  has_many :projects, through: :project_developers

  def as_json
    result = {}

    result['id'] = id
    result['first_name'] = first_name
    result['last_name'] = last_name
    result['email'] = email

    result
  end
end
