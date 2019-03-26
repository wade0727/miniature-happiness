class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    # To display in the params hash
    #render plain: params[:article].inspect

    # if article was saved then flash notice and redirect to @article
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article saved!"
      redirect_to article_path(@article)
      # if it didnt save render new template again.
    else
      render 'new'
    end
  end



  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
