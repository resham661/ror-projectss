class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @articles = Article.new
  end

  def create
    @articles = Article.new(article_params)
    
    if @articles.save
      # redirect_to @articles
      flash[:notice] = "Article saved successfully!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def show

  end

  def edit
                                    
  end

  def update
    if @articles.update(article_params)
      flash[:notice] = "Article #{@articles.id} updated successfully!!"
      redirect_to articles_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @articles.destroy
    flash[:notice] = "Article #{@articles.id} deleted successfully."
    redirect_to articles_path, status: :see_other
  end
  

  private
    def set_article
      @articles = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body)
    end
end
