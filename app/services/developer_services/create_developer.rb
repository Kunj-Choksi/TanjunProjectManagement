module DeveloperServices
  class CreateDeveloper

    def initialize(params, admin)
      @params = params
      @admin = admin
    end

    def call
      set_default_developer_params

      @admin.developers.create!(params)
    end

    private

    attr_reader :params, :admin

    def set_default_developer_params
      @params[:password] = "somesecretpassword"
      @params[:status] = "initiated"
    end
  end
end