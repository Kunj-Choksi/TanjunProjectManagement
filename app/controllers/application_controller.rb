class ApplicationController < ActionController::API
  before_action :create_new_api_manager

  private

  def create_new_api_manager
    @api_manager = ApiManager.new
  end
end
