class ArticlesController < ApplicationController

  def index
    load_articles
    decorate_articles
  end

  def show
    load_article
    decorate_article
  end

  private

  def load_article
    @article = Article.friendly.find(params[:id])
  end

  def load_articles
    @q = Article.ransack(params[:q])
    # binding.pry
    @articles = @q.result.page(params[:page])
  end

  def decorate_article
    @article = ArticleDecorator.decorate(@article)
  end

  def decorate_articles
    @articles = ArticleDecorator.decorate_collection(@articles)
  end

end
