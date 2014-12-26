class HomeController < ApplicationController
  # use if restful resources can be loaded and checked for authorization
  #load_and_authorize_resource

  def index
    authorize! :index, self
  end

end
