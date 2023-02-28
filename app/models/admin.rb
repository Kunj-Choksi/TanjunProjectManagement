class Admin < ApplicationRecord
  has_secure_password

  enum status: {active: 'active', inactive: 'inactive'}

  def as_json
    result = Hash.new
    result['first_name'] = self.first_name
    result['last_name'] = self.last_name
    result['email'] = self.email
    result['status'] = self.status

    result
  end
end
