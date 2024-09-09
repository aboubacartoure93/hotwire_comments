class CommentsController < ApplicationController

  before_action :set_post	
  before_action :authenticate_user!	
  
  def create
  	@comment = @post.comments.new(comment_params.merge(user: current_user))

  	respond_to do |format|
  		if @comment.save
        format.turbo_stream
  			format.html { redirect_to post_url(@post), 
  				notice: "Comment was successfully created."}
  			format.json { render :show, status: :created, location: @comment }

  		else
        format.turbo_stream
  			format.html { render :new, status: :unprocessable_entity }
  				
  			format.json { render json: @comment.errors, status: :unprocessable_entity }
  		end
  	end
  			
  end


  private

	  def set_post
	  	@post = Post.find(params[:post_id])
	  end

	  def comment_params
	  	params.require(:comment).permit(:content)
	  end


end
