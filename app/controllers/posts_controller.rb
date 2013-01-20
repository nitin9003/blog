class PostsController < ApplicationController

  before_filter :confirm_login, :admin, :check_for_cancel

  layout 'admin'

  def index
    @posts = Post.all

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def new
    @post = Post.new
    @post_count = Post.count + 1
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end

  end


  def create

    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: "New category has been created" }
        format.json { render json: @post.to_json }
      else
        format.html { render action: "new"}
        format.json { render json: @posts.errors }
      end
    end
  end
  
  def show
    @posts = Post.all
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end

  def edit
    @post_count = Post.count
    puts "#{params[:id]}"
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to dashboard_path(@post.id), :notice => "Post has been updated"}
        format.json { render json: @post.to_json }
      else
        format.html { render action: "edit"}
        format.json { render json: @post.errors }
      end
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_path
  end

  def check_for_cancel
    unless params[:cancel].blank?
      redirect_to posts_path
    end
  end

  def rating
    @post = Post.find(:post_id)
    @past_rating = @post.rating
    @current_rating = params[:rating]
  end

end
