class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    
    if @post.save
      redirect_to @post, notice: 'Пост успішно створено.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Пост успішно оновлено.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Пост успішно видалено.'
  end
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
  
  def authorize_user!
    unless @post.user == current_user
      redirect_to posts_path, alert: 'Ви не маєте прав для цієї дії.'
    end
  end
end
