class Developer < ApplicationRecord
  has_secure_password

  enum status: { active: 'active', inactive: 'inactive', initiated: 'initiated', onboarded: 'onboarded' }

  def as_json
    result = {}

    result['first_name'] = first_name
    result['last_name'] = last_name
    result['email'] = email

    result
  end
end
