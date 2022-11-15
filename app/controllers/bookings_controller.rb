class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @pet = Pet.find(params[:pet_id])
  end

  def create
    raise

    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :date_start, :date_end)
  end
end
