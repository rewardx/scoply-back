module ApiV1
  class CrudController < ApiV1Controller
    def index
      render_api model.all
    end

    def new
      model.new
    end

    def create
      resource = model.new params
      if resource.save
        redirect_to root_path
      else
        render :new
      end
    end

    def show
      resource
    end

    def edit
      resource
    end

    def update
      resource.update params
    end

    def destroy
      resource.destroy!
    end

    protected

    def resource
      @resource ||= model.find params[:id]
    end

    def model
      raise NotImplementedError
    end
  end
end
