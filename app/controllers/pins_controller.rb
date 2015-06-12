class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all.order('created_at DESC')

  end

  def new
    @pin = current_user.pins.build

  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      # using @pin here automatically routes to the pin's show page
      redirect_to @pin, notice: 'Successfully created new Pin'
    else
      render 'new'
    end
  end

  def show

  end

  def edit


  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated!'
    else
      render 'edit'
    end
  end

  def destroy
    # the correct pin is already found by the before_action
    @pin.destroy
    redirect_to root_path
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image)
  end

  def find_pin
    # using private method for this so multiple methods can use it
    @pin = Pin.find(params[:id])
  end
end
