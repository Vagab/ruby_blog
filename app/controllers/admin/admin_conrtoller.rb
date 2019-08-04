class ArticlesController < ActionController::Base

  before_action :set_article

  def index
    @articles = Article.all
  end

  def show
    #@article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to article_path, notice: "Article has been created"
    else
      render :new
    end
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def delete
    #@article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to article_path, notice: "Model successfully updated."
    else
      render :edit
    end
  end

  def update
    #@article = Article.find(params[:id])
    if @article.destroy
      redirect_to article_path, notice: "Model successfully deleted."
    else
      redirect_to article_path, notice: "Not possible to destroy the Model."
    end
  end

  private

  def set_book
    #@article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
