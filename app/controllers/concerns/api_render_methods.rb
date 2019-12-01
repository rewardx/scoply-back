module Concerns::ApiRenderMethods
  extend ActiveSupport::Concern

  included do
    class_eval do
      include InstanceMthods
    end
  end

  module InstanceMthods
    def render_api(jsonable, status=:ok)
      render json: jsonable, status: status
    end

    def render_api_done(status=:ok)
      render_api({ action: :done }, status)
    end
  end
end
