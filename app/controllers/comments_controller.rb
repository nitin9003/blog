class CommentsController < ApplicationController

  before_filter :find_post 
  layout 'admin'

  def index
    @comments = @post.comment.all

    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end

  def new
    @comment = @post.comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end

  end


  def create

    @comment = @post.comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_path, notice: "New category has been created" }
        format.json { render json: @comment.to_json }
      else
        format.html { render action: "new"}
        format.json { render json: @comment.errors }
      end
    end
  end

  def edit
  end

  def update
  end

  def delete
    Comment.delete(params[:id])
  end

private

  def find_post
    @post = Post.find(:id)
    puts @post
  end

end
