class ArticlesController < ApplicationController
  
  
  def index
    # @articles = Article.all
    # @articles = Article.paginate(:page => params[:page], :per_page => 3)
    
    @search = Article.search(params[:q])
    @articles = @search.result.paginate(:page => params[:page], :per_page => 3)
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
 
    @article.save
    redirect_to @article
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :category, :body, :tag_list)
  end
  
end
