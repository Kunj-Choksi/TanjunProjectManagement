class DeveloperController < AbstractAdminController
  before_action :authenticate_admin, only: [:create]
  before_action :check_admin_status, only: [:create]

  def create
    if (msg = @api_manager.has_sufficient_params(%w[first_name last_name email]))
      render json: @api_manager.render_error_message(msg)
      return
    end

    developer = DeveloperServices::CreateDeveloper.new(developer_params, @admin).call

    if developer.persisted?
      render json: @api_manager.render_success_message("Created new Developer")
    else
      render json: @api_manager.render_error_message(developer.errors.full_messages)
    end
  end

  def activate_account
    if (msg = @api_manager.has_sufficient_params(%w[email password password_confirmation]))
      render json: @api_manager.render_error_message(msg)
      return
    end

    developer = Developer.find_by_email(params[:email])

    if developer.onboarded?
      render json: @api_manager.render_error_message('You can not update password for onboarded user!')
      return
    end

    developer.update(password: params[:password], password_confirmation: params[:password_confirmation], status: 'onboarded')

    render json: @api_manager.render_success_message("Account activated!")
  end

  def login
    if (msg = @api_manager.has_sufficient_params(%w[email password]))
      render json: @api_manager.render_error_message(msg)
      return
    end

    developer = Developer.find_by_email(params[:email])

    unless developer.present?
      render json: @api_manager.render_error_message('Developer not found!')
      return
    end

    if developer.initiated?
      render json: @api_manager.render_error_message('Account not activated yet!')
      return
    end
    
    if developer.authenticate(params[:password])
      developer = developer.as_json
      developer["token"] = Jwt.encode_token({email: params[:email]})
      
      render json: @api_manager.render_result_json(developer)      
    else
      render json: @api_manager.render_error_message('Invalid email or password!')
    end
  end

  private

  def developer_params
    params.permit(:first_name, :last_name, :email)
  end
end
