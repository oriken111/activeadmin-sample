class ArticlesController < InheritedResources::Base

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "投稿が完了しました。"
      redirect_to root_url
    else
      render 'home/index'
    end
  end

  private

    def article_params
      params.require(:article).permit(:content, :approved, :user_id)
    end
end
