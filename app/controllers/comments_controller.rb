class CommentsController < ApplicationController
  before_action :set_post

  def index
    #@comment = @post.comments.all
  end

  def show
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def new
    @comment = @post.comments.new
    render partial: "form"
  end

  def update
    if @comment.update(@comment_params)
      redirect_to post_comment_path
    else
      render :edit
    end
  end

  def edit
    render partial: "form"
  end

  def destroy
    @comment.destroy
    redirect_to post_comments_path
  end

  private
    def comment_params
      params.require(:comment).permit(:message)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end