class ScentSchedulesController < ApplicationController
  before_action :authenticate, only: [:create]

  def context
    {current_user: @current_user}
  end
end
