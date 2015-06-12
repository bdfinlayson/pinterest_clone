class PinsController < ApplicationController
  def index

  end

  def new
    @pin = Pin.new

  end

  def create
    @pin = Pin.new(pin_params)

    if @pin.save
      # using @pin here automatically routes to the pin's show page
      redirect_to @pin, notice: 'Successfully created new Pin'
    else
      render 'new'
    end
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description)
  end
end
