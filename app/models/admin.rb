class Admin < ApplicationRecord
  has_secure_password

  enum status: {active: 'active', inactive: 'inactive'}
end
