require 'rails_helper'

RSpec.describe Admin, type: :model do
  before do
    @admin1 = Admin.create(first_name: "Test", last_name: "LName", email: "test@gmail.com", password: "sompassword", password_confirmation: "sompassword")
  end

  describe "model validation" do
    it "should be valid with attrs" do
      expect(@admin1).to be_valid
    end

    it "should not valid w/o first name" do
      @admin1.first_name = nil
      expect(@admin1).to be_invalid
    end

    it "should not valid w/o last name" do
      @admin1.last_name = nil
      expect(@admin1).to be_invalid
    end

    it "should have a unique email" do
      @admin2 = Admin.create(first_name: "Test", last_name: "LName", email: "test@gmail.com", password: "sompassword", password_confirmation: "sompassword")

      expect(@admin2).to be_invalid
    end

    it "should have a valid email format" do
      @admin3 = Admin.create(first_name: "Test", last_name: "LName", email: "testail.com", password: "sompassword", password_confirmation: "sompassword")

      expect(@admin3).to be_invalid
    end

    it "should have a default status of inactive" do
      expect(@admin1.status).to eq('inactive')
    end
  end
end
