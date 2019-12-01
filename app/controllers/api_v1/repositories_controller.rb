module ApiV1
  class RepositoriesController < CrudController

    def index
      return render_api model.all if current_user.super_admin?
      render_api current_user.repositories
    end

    protected

    def model
      Repository
    end
  end
end
