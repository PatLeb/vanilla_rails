class HomeController < ApplicationController
  # devise authorization on single controller with whitelist exception without auth
  #before_action :authenticate_user!, except: [:index]
  # use if restful resources can be loaded and checked for authorization
  #load_and_authorize_resource

  def index
    authorize! :index, self
  end

end
