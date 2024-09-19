class ReservationsController < ApplicationController
  before_action :set_event


  def create
    @reservation = @event.reservations.find_or_initialize_by(user: current_user)

    if @event.reservations.where(status: true).count < @event.capacity
      if @reservation.save
        redirect_to @event, notice: 'RSVP confirmed!'
      else
        redirect_to @event, alert: 'Unable to RSVP. Please try again.'
      end
    else
      redirect_to @event, alert: 'Sorry, the event is at full capacity.'
    end
  end

  def destroy
    @reservation = @event.reservations.find_by(user: current_user)

    if @reservation
      @reservation.destroy
      redirect_to @event, notice: 'RSVP canceled.'
    else
      redirect_to @event, alert: 'RSVP not found.'
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
