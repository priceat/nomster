class CommentsController < ApplicationController
  before_action :authenticate_user!
  #respond_to :html, :js
  def create 
    @place = Place.find(params[:place_id])
    @place.comments.create(comment_params.merge(:user => current_user))
    redirect_to place_path(@place)
    #@comment.place = @place
    #@new_comment = Comment.new

    #if @comment.save
     # flash[:notice] = "Comment was created."
    #else
     # flash[:error] = "Comment failed to save."
   # end
    
    #respond_with(@comment) do |format|
     # format.html { redirect_to [@place] }
    #end
  end


  def destroy
     @place = Place.find(params[:place_id])
     @comment = @place.comments.find(params[:id])

     authorize @comment
 
     if @comment.destroy
       flash[:notice] = "Comment was deleted successfully."
       
     else
       flash[:error] = "There was an error deleting the comment."
     end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post]}
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:message, :rating)
    end
end
