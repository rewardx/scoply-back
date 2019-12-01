module ApiV1
  class CompaniesController < CrudController

    def index
      return render_api model.all if current_user.super_admin?
      render_api []
    end

    protected

    def model
      Company
    end
  end
end
