class RootController < ApplicationController
  def index
    render json: {
      version: 1.0,
      target: Rails.target
    }
  end
end
