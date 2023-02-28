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

    admin_id = payload[0]['email']
    @admin = Admin.find_by_email(admin_id)
    return if @admin.present?

    @api_manager.render_error_message('Admin not found!')
    nil
  end

  private

  def auth_header
    request.headers['Authorization']
  end
end
