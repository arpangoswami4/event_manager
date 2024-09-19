class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index

    @events = Event.all

    if params[:search_title].present?
      @events = @events.where('title LIKE ?', "%#{params[:search_title]}%")
    end

    if params[:search_location].present?
      @events = @events.where('location LIKE ?', "%#{params[:search_location]}%")
    end

  end

  def show
    @attendees = @event.users
    @event_comments = @event.comments.includes(:user)
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create

    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end

  end

  def update

    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other, notice: "Event was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :capacity, :date, :time, :host, :banner)
  end

end
