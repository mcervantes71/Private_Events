class AttendeesController < ApplicationController
  before_action :authenticate_user!

  def create
    @attendee = current_user.attendees.build(attended_event_id: params[:event_id])

    @attendee.save

    redirect_to event_path(params[:event_id])
  end

  def destroy
    @attendee = current_user.attendees.find_by(attended_event_id: params[:event_id])
    Attendee.destroy(@attendee.id)

    redirect_to event_path(params[:event_id])
  end

  private

  def attendee_params
    params.require(:attendee).permit(:event_id)
  end
end
