class Admin::ArticlesController < AdminController

  def index
    load_articles
  end

  def show
    load_article
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
    if @article.save
      redirect_to admin_articles_path, notice: "Article has been created"
    else
      false
    end
  end

  def update_article
    if @article.update_attributes(article_params)
      redirect_to admin_article_path, notice: "Article successfully updated."
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

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    return {} unless params[:article]

    params.require(:article)
      .permit(:title, :description)
      .merge(user: current_user)
  end

end
