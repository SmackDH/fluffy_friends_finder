class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking])
    @pets = current_user.pets
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :date_start, :date_end)
  end
end
