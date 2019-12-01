module ApiV1
  class ApiV1Controller < ApplicationController
    include Concerns::ApiRenderMethods

    before_action :authenticate_user!
  end
end
