class Admin::ArticlesController < ApplicationController

  #before_action :set_article

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_articles_path, notice: "Article has been created"
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to admin_article_path, notice: "Article successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to admin_articles_path, notice: "Article successfully deleted."
    else
      redirect_to admin_article_path, notice: "Not possible to destroy the Article."
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
