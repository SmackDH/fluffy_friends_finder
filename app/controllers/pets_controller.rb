class PetsController < ApplicationController
before_action :set_pet, only: [:show]

  def index
    @pets = policy_scope(Pet)
  end

  def show
    @pet = Pet.find(params[:id])
    @booking = Booking.new
    authorize @pet
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

end
