class ProjectController < AbstractAdminController
  before_action :authenticate_admin, only: [:create]
  before_action :check_admin_status, only: [:create]

  class create
    if(msg = @api_manager.has_sufficient_params(%w[name]))
      render json: @api_manager.render_error_response(msg)
    end
  end
end
