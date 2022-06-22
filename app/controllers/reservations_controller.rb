class ReservationsController < ApplicationController
  def index
    @rooms = Reservation.where(user_id: @current_user.id)
  end

  def confirmation
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(id: params[:room_id])
    if @reservation.valid?
      @seconds = @reservation.end_date - @reservation.start_date
      @day = (@seconds / 1.days).floor
      @sum_price = @day * @room.price * @reservation.number
    else
      redirect_to room_path(@room.id), flash: { error: @reservation.errors.full_messages }
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation.id)
      flash[:notice] = "予約が完了しました"
    end
  end

  def show
    @reserve_room = Reservation.find_by(id: params[:id])
  end
end

private

def reservation_params
  params.permit(:number, :start_date, :end_date, :sum_price).merge(user_id: params[:user_id], room_id: params[:room_id])
end
