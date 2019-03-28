class ArticlesController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    if params[:title]
      @articles = Article.where('title LIKE ?', "%#{params[:title]}%")
    else
      @articles = Article.all
    end
  end

  def new
    @article = Article.new
  end

  def show
  end

  def edit
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
    if @article.update(article_params)
      flash[:notice] = "Article updated."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article has been deleted. (╯°□°)╯︵ ┻━┻"
    redirect_to articles_path
  end



  private
    def set_params
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
end
