class ProjectController < AbstractAdminController
  before_action :authenticate_admin
  before_action :check_admin_status

  def create
    if (msg = @api_manager.has_sufficient_params(%w[name]))
      render json: @api_manager.render_error_message(msg)
      return
    end

    project = Project.new

    project.name = params[:name]
    project.status = 'initiated'
    project.created_by_id = @admin.id

    if project.save
      render json: @api_manager.render_success_message('Project created!')
    else
      render json: @api_manager.render_error_message(project.errors.full_messages)
    end
  end

  def add_developer
    if (msg = @api_manager.has_sufficient_params(%w[developer_id project_id]))
      render json: @api_manager.render_error_message(msg)
      return
    end

    unless @admin.own_this_project(params[:project_id])
      render json: @api_manager.render_error_message("You are not authorized to add this developer to this project!")
      return
    end

    unless @admin.own_this_developer(params[:developer_id])
      render json: @api_manager.render_error_message("You are not authorized to add this developer to this project!")
      return
    end

    project_dev = ProjectDeveloper.where(project_id: params[:project_id], developer_id: params[:developer_id], status: 'active').first

    if project_dev.present?
      render json: @api_manager.render_error_message("Developer is already added!")
      return
    end
    project_dev = ProjectDeveloper.new(project_id: params[:project_id], developer_id: params[:developer_id], status: 'active', added_by_id: @admin.id, added_on: Time.now)

    if project_dev.save
      render json: @api_manager.render_success_message('Added Developer!')
    else
      render json: @api_manager.render_error_message(project_dev.errors.full_messages)
    end
  end
end
