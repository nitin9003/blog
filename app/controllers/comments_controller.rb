class CommentsController < ApplicationController

 
  layout 'admin'

  def index
    @comments = Comment.all

    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end

  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end

  end


  def create

    @comment = Comment.new(params[:comment])

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



end
