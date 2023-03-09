require 'rails_helper'

RSpec.describe ProjectDeveloper, type: :model do
  before do
    @admin = Admin.create(first_name: 'Admin', last_name: 'Guy', email: 'admin@gmail.com')
  end

  let(:project) { Project.create(name: 'Test Project', created_by_id: @admin.id) }
  let(:developer) { Developer.create(first_name: 'Some', last_name: 'Guy', email: 'some@gmail.com', created_by_id: @admin.id) }
  let(:project_developers) {ProjectDeveloper.create(project_id: project, developer_id: developer, added_by_id: @admin.id, added_on: Time.now, status: "active") }


  # it "should belongs to developer" do
  #   expect(project_developers).to belongs_to(developer)
  # end

  # it { should validate_presence_of(:developer) }
end
