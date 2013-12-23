class PostsController < ApplicationController
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


  def index
  	@posts = Post.all
  end

  def show
  	@posts = Post.find(params[:id])
  end

  private 
  def post_params()
  	params.require(:post).permit!
  end
end