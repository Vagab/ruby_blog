class AdminController < ApplicationController
  before_action :check_user_role

  private

  def check_user_role
    unless current_user and current_user.admin?
      redirect_to root_path
    end
  end

end
