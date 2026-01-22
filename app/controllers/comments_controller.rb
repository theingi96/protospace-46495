class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params) #
    if @comment.save
      redirect_to prototype_path(@comment.prototype) # အောင်မြင်ရင် detail page သို့
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show", status: :unprocessable_entity # မအောင်မြင်ရင် render ပြန်လုပ်မည်
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id]) #
  end
end