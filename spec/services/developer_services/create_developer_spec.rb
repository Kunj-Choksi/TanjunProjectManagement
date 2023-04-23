require 'rails_helper'

RSpec.describe DeveloperServices::CreateDeveloper do
  describe '#call' do
    context "when params are valid" do
      let(:params) { { first_name: "John", last_name: "Doe", email: "john@doe.com" }  }
      let(:admin) { create(:admin) }

      it 'creates a new developer' do
        expect { described_class.new(params, admin).call }.to change(Developer, :count).by(1)
      end
    end

    context "when params are invalid" do
      let(:params) { {} }
      let(:admin) { create(:admin) }

      it "should raise an ActiveRecord::RecordInvalid error" do
        expect { described_class.new(params, admin).call }.to raise_error(ActiveRecord::RecordInvalid)
      end

    end
  end
end