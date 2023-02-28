class AdminController < AbstractAdminController
  def sign_up
    if (msg = @api_manager.has_sufficient_params(params, %w[first_name last_name email password password_confirmation]))
      render json: @api_manager.render_error_message(msg)
      return
    end

    admin = Admin.new
    admin.first_name = params[:first_name]
    admin.last_name = params[:last_name]
    admin.email = params[:email]
    admin.password = params[:password]
    admin.password_confirmation = params[:password_confirmation]

    if admin.save
      render json: @api_manager.render_result_json(admin)
    else
      render json: @api_manager.render_error_message(admin.errors.full_messages)
    end
  end

  def login
    if (msg = @api_manager.has_sufficient_params(params, %w[email password]))
      render json: @api_manager.render_error_message(msg)
      return
    end

    admin = Admin.find_by(email: params[:email])

    unless admin.present?
      render json: @api_manager.render_error_message('Admin not Found')
      return
    end

    if admin.authenticate(params[:password])
      admin = admin.as_json
      admin['token'] = Jwt.encode_token({ email: params[:email] })
      render json: @api_manager.render_result_json(admin)
    else
      render json: @api_manager.render_error_message('Invalid email or password!')
    end
  end
end
