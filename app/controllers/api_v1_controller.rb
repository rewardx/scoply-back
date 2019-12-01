class ApiV1Controller < ApplicationController
  before_action :authenticate_user!
end
