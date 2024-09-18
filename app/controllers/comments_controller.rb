class CommentsController < ApplicationController
  before_action :set_event

  def create
    @comment = @event.comments.new(comment_params.merge(user: current_user))

    if @comment.save
      redirect_to @event, notice: 'Comment added!'
    else
      redirect_to @event, alert: 'Unable to add comment. Please try again.'
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
