class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = current_user.posts.all
  end
 
  def show
    @comments = @post.comments
  end
 
  def new
    @post = Post.new
    render partial: "form"
  end
 
  def create
    @post = current_user.posts.new(post_params)
 
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
 
  def edit
    render partial: "form"
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end
 
  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content)
    end
 end