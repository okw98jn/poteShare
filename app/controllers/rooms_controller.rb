class RoomsController < ApplicationController
  before_action :not_login, { only: [:new, :create, :index] }

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "投稿が完了しました"
      redirect_to("/rooms/#{@room.id}")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @rooms = Room.where(user_id: @current_user.id)
  end

  def show
    @room = Room.find_by(id: params[:id])
  end

  def search
    @search_rooms = Room.search(params[:search])
  end

  def keyword_search
    @search_rooms = Room.keyword_search(params[:keyword])
  end

  private

  def room_params
    params.require(:room).permit(:name, :address, :introduction, :price, :room_image).merge(user_id: @current_user.id)
  end
end
