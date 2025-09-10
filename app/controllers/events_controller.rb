class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to events_path, notice: "Event created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.expect(event: [ :date, :name, :details ])
  end
end
