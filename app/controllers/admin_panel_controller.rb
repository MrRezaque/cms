class AdminPanelController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  # def after_sign_out_path_for(resource)
  #   root_path
  # end
end