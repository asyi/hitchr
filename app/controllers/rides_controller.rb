class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
    @booking = @ride.bookings.build
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.user_id = current_user.id
    if @ride.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @ride = Ride.find(params[:id])
    @ride.destroy
    UserMailer.cancelled_seat(@ride).deliver_later 
    redirect_to root_path
  end

  private
  def ride_params
    params.require(:ride).permit(:date, :time, :seats_available, :comments, :start_location, :end_location)
  end

end
