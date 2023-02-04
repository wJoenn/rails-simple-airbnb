class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update]

  def index
    @flats = Flat.all
    return unless params[:search]

    redirect_to flats_path if params[:search] == ''
    @title = params[:search]
    @flats = Flat.where('name like ?', "%#{params[:search]}%")
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save!
      redirect_to flat_path(@flat)
    else
      render 'new'
    end
  end

  def show() end

  def edit() end

  def update
    if @flat.update!(flat_params)
      redirect_to flat_path(@flat)
    else
      render 'edit'
    end
  end

  def destroy
    Flat.destroy(params[:id])
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :number_of_guests, :price_per_night, :image)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
