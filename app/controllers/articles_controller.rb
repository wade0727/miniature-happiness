class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    # To display in the params hash
    #render plain: params[:article].inspect

    # to create and pass to database
    @article = Article.new(article_params)
    @article.save
    #return to show page after saving in database
    redirect_to articles_show(@article)
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
