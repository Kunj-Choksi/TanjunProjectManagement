class ApplicationController < ActionController::API
  # rescue_from ActionController::ParameterMissing, with: :handle_missing_api_params
  before_action :create_new_api_manager

  private
  
  # def handle_missing_api_params(exception)
  #   render json: { error: exception.message }, status: :bad_request
  # end

  def create_new_api_manager
    @api_manager = ApiManager.new(params)
  end
end
