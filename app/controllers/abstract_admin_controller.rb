class AbstractAdminController < ApplicationController
  def authenticate_admin
    unless auth_header.present?
      @api_manager.render_error_message('Headers not present!')
      return
    end

    payload = Jwt.decode_token(auth_header)

    if payload.empty?
      @api_manager.render_error_message('Unauthorized! Token not present?')
      return
    end

    email = payload[0]['email']
    @admin = Admin.find_by_email(email)
    unless @admin.present?
      render json: @api_manager.render_error_message('Admin not found!')
    end
  end
  
  def check_admin_status
    if @admin.inactive?
      render json: @api_manager.render_error_message("Admin's account is not activated yet!")
      return
    end
  end

  private

  def auth_header
    request.headers['Authorization']
  end
end
