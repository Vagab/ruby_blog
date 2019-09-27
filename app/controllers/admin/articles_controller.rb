class Admin::ArticlesController < AdminController

  def index
    load_articles
    decorate_articles
  end

  def show
    load_article
    decorate_article
  end

  def new
    build_article
  end

  def create
    build_article
    create_article or render :new
  end

  def edit
    load_article
  end

  def update
    load_article
    update_article or render :edit
  end

  def destroy
    load_article
    destroy_article
  end

  private

  def destroy_article
    @article.destroy
    redirect_to admin_articles_path, notice: "Article successfully deleted."
  end

  def create_article
    result = CreateArticle.new(attributes: article_params).call
    if result.success?
      redirect_to admin_article_path(result.article)
    else
      false
    end
  end

  def update_article
    result = UpdateArticle.new(attributes: article_params, article: @article).call
    if result.success?
      redirect_to admin_article_path(result.article)
    else
      false
    end
  end

  def build_article
    @article = Article.new(article_params)
  end

  def load_articles
    @articles = Article.all
  end

  def load_article
    @article = Article.find(params[:id])
  end

  def article_params
    return {} unless params[:article]

    params.require(:article)
      .permit(:title, :description, :published, :comma_separated_tags)
      .merge(user: current_user)
  end

  def decorate_article
    @article = Admin::ArticleDecorator.decorate(@article)
  end

  def decorate_articles
    @articles = Admin::ArticleDecorator.decorate_collection(@articles)
  end

end
