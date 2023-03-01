class ProjectController < AbstractAdminController
  before_action :authenticate_admin, only: [:create]
  before_action :check_admin_status, only: [:create]

  def create
    if (msg = @api_manager.has_sufficient_params(%w[name]))
      render json: @api_manager.render_error_response(msg)
      return
    end

    project = Project.new

    project.name = param[:name]
    project.status = 'initiated'
    project.created_by_id = @admin.id

    if project.save
      render json: @api_manager.render_success_message('Project created!')
    else
      render json: @api_manager.render_error_message(project.errors.full_messages)
    end
  end
end
