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

  def new
    @user = current_user
    @pet = Pet.new
    authorize @pet
  end

  def create
    @user = current_user
    @pet = Pet.new(pet_params)
    @pet.user = @user
    authorize @pet
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :price, :description, :photo)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

end
