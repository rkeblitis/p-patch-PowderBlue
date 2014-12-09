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

  private

  def event_params
    (params.require(:event).permit(:name, :datetime, :description, :user_id, :category_ids => []))
  end
end
