class EventAttendancesController < ApplicationController
  before_action :set_event

  def create
    @attendance = @event.event_attendances.build(user: current_user)

    if @attendance.save
      redirect_to @event, notice: "You are attending the event"
    else
      redirect_to @event, alert: "Could not join the event"
    end
  end

  def destroy
    @attendance = @event.event_attendances.find_by(user: current_user)
    @attendance&.destroy
    redirect_to @event, notice: "You are no longer attending this event."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
