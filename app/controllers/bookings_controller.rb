class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    @pet = Pet.find(params[:pet_id])
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user
    @pet.start = @booking.date_start
    @pet.end = @booking.date_end
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render "pets/show", status: :unprocessable_entity
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:status, :date_start, :date_end)
  end


end
