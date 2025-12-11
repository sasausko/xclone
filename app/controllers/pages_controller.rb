class PagesController < ApplicationController
  def home
      @posts = Post.order(created_at: :desc).limit(5)
  end

  def about
  end

  def contact
  end

  def terms
  end

  def privacy
  end
end
