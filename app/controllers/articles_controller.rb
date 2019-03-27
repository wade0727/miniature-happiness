class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
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

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "Article updated."
      redirect_to article_path(@article)

    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article has been deleted. (╯°□°)╯︵ ┻━┻"
    redirect_to articles_path
  end



  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
