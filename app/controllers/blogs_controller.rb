class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy fav unfav]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  def fav
    current_user.favorites.create(blog_id: @blog.id)
    redirect_to blog_path(@blog)
  end

  def unfav
    current_user.favorites.find_by(blog_id: @blog.id).delete
    redirect_to blog_path(@blog)
  end

  private

    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content)
    end

end
