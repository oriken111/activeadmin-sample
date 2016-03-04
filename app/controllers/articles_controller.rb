class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:notice] = "URL is sent! We appreciate your work. Please wait a little for approval."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to root_path
      flash[:success] = "Updated your post!"
    else
      render 'edit'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to root_path
    flash[:success] = "Deleted your post."
  end

  private

    def article_params
      params.require(:article).permit(:content)
    end
end
