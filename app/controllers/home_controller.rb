class HomeController < ApplicationController
  def index
    if user_signed_in?
      @articles = current_user.article
    end
  end
end
