class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking])
    @pets = current_user.pets
  end

  def update
    @booking = @booking.find(params[:id])
    @booking.pet.available = true
    # @booking = Booking.new(booking_params)
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render bookings
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :date_start, :date_end)
  end
end
