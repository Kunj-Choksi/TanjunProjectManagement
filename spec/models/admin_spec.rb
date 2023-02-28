require 'rails_helper'

RSpec.describe Admin, type: :model do
  admin1 = Admin.new

  it 'should not be valid with no params' do
    expect(admin1).not_to be_valid
  end

  admin2 = described_class.new(
    "first_name": 'Kunj',
    "last_name": 'Choksi',
    "email": 'kunj07soni@gmail.com',
    "password": 'password123',
    "password_confirmation": 'password123'
  )

  it 'should have default status of inactive' do
    expect(admin2.status).to eq('inactive')
    expect(admin2.status).not_to eq('pending')
  end
end
