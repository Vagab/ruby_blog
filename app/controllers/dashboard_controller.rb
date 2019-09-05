class DashboardController < ApplicationController
  def index
    @articles = Article.all
    @users = User.all
  end
end
