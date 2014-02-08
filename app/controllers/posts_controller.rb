class PostsController < ApplicationController

  before_action :set_post, only:[:show, :edit, :update]

	def new
		@posts = Post.new
	end

	def create
		@posts = Post.new(post_params)
    @posts.user_id = User.first.id
    if @posts.save
      flash[:notice] = "Your post was created"
		  redirect_to posts_path
    else
      render 'new'
    end
	end

  def edit
    
  end

  def update
    
    if @posts.update(post_params)
      flash[:notice] = "Your post was updated"
      redirect_to posts_path(@posts)
    else
      render 'show'
    end
  end


  def index
  	@posts = Post.all
  end

  def show
  	
  end


  def set_post
    @posts = Post.find(params[:id])
  end

  private 
  def post_params()
  	params.require(:post).permit!
  end

end