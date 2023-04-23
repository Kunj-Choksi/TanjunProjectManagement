class Developer < ApplicationRecord
  has_secure_password

  enum status: { active: 'active', inactive: 'inactive', initiated: 'initiated', onboarded: 'onboarded' }

  has_many :project_developers
  has_many :projects, through: :project_developers

  validates :first_name, :last_name, :email, :status, :password_digest, presence: true

  def as_json
    result = {}

    result['id'] = id
    result['first_name'] = first_name
    result['last_name'] = last_name
    result['email'] = email

    result
  end
end
