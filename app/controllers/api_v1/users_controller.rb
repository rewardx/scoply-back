module ApiV1
  class UsersController < CrudController

    def index
      return render_api model.all if current_user.super_admin?
      return render_api current_user.company.users if current_user.admin?
      render_api []
    end

    protected

    def model
      User
    end
  end
end
