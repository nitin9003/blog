class CommentsController < ApplicationController

  before_filter :find_post 
  layout 'admin'

  def index
    @comments = @post.comments.all

    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end

  def new
    @comment = @post.comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end

  end


  def create
puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
puts @post.id
puts params[:comment].inspect

   
      if request.referer.to_s.include?('post') 
        @post.comments.create(params[:comment])
          redirect_to :back
      elsif request.referer.to_s.include?('blog')

        @post.comments.create(params[:comment])
          redirect_to :back
      else
        render action: "comments/new"
      end
  end

  def edit
     @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to dashboard_path(@post.id), :notice => "Comment has been updated"}
        format.json { render json: @post.to_json }
      else
        format.html { render action: "edit"}
        format.json { render json: @comment.errors }
      end
    end

  end

  def destroy
    @comment = @post.comments.find(params[:id]) 
    @comment.delete
  end

private

  def find_post
    @post = Post.find(params[:post_id])
  end

end
