class ArticlesController < ApplicationController
  before_action :find_article, only: [:destroy, :update, :show, :edit]

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    redirect_to articles_path
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def show
  end

  def index
    @articles = Article.all
  end

  def edit
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
