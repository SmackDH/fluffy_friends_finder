class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_pet, only: [:show]

  def home
  end

  def index
    if params[:query].present?
      @pets = policy_scope(Pet).global_search(params[:query])
    else
      @pets = policy_scope(Pet)
    end
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
