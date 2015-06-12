class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all.order('created_at DESC')

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

  def show

  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description)
  end

  def find_pin
    # using private method for this so multiple methods can use it
    @pin = Pin.find(params[:id])
  end
end
