class ApiManager
  def has_sufficient_params(params, api_params)
    api_params.each do |ap|
      unless params.keys.include?(ap)
        return "#{ap.humanize} not present!"
      end
    end
    nil
  end

  def render_result_json(result)
    { status: 'success', result: result}
  end

  def render_success_message(message)
    { status: 'success', message: message}
  end

  def render_error_message(message)
    { status: 'error', message: message}
  end
end
