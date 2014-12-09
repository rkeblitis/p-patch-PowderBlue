class EventsController < ApplicationController

  def index
  end

  def new
    @event = Event.new
    @categories = Category.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to my_account_path, notice: "Event created!"
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
    @event = Event.find(params[:id])
  end

  def update
    @categories = Category.all
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to my_account_path, notice: "Event updated!"
    else
      render :edit
    end
  end

  private

  def event_params
    (params.require(:event).permit(:name, :datetime, :description, :user_id, :category_ids => []))
  end
end
