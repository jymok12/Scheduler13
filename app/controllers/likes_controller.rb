class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_meeting
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @meeting.likes.create(user_id: current_user.id)
    end
    redirect_to meeting_path(@meeting)
  end


  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to meeting_path(@meeting)
  end

  def find_like
   @like = @meeting.likes.find(params[:id])
  end

  private
  def find_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, meeting_id:
    params[:meeting_id]).exists?
  end

end
