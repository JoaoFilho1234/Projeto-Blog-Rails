class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]
  


  def index
    current_page = (params[:page] || 1).to_i

    @posts = Post.order(created_at: :desc).page(current_page).per(3)
  end

  def show
  
  end
    
  def new 
    @post = current_user.posts.new
  end

  def create 
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    
  end

  def update 
    

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    
    @post.destroy

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end
end
