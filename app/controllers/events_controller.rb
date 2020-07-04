class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @events = Event.all
    @events = Event.order(date: :desc)
  end

  def show
    @event = Event.find(params[:id])

    @attendee = Attendee.new
    @attendee.event_id = @event.id
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash.notice = "Event '#{@event.name}' Successfully Created!"

      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash.notice = "Event '#{@event.name}' Successfully Updated!"

      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.destroy(params[:id])

    flash.notice = "Event '#{@event.name}' Successfully Deleted!"

    redirect_to user_path(current_user)
  end

  private

  def event_params
    params.require(:event).permit(:name, :details, :location, :date, :creator_id)
  end
end
