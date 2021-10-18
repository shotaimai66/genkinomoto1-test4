class ReservationsController < ApplicationController
  skip_before_action :authenticate_staff!, only: [:index, :new, :create]
  def index
    # start_day = Date.today
    # end_day = start_day + 6.day
    # @selected_days = start_day.daily(end_day).to_a
    # @reservations = Reservation.in_selected_days(@selected_days)
    @reservations = Reservation.all.includes(:guest)
  end

  def confirm_reservation
    @reservations_on_request = Reservation.on_request.includes(:guest)
    @reservations = Reservation.all.includes(:guest)
    respond_to do |format|
      format.html
      format.json { @reservations }
    end
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.apply!
    if @reservation.save
      redirect_to reservations_path, notice: "予約しました"
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    title_for_staff_comment = "予約確定 #{@reservation.guest.email}様　#{@reservation.course_i18n}"
    @reservation.update(status: :on_reserve, title_for_guest: "予約確定", title_for_staff: title_for_staff_comment)
    redirect_to confirm_reservation_reservations_url, notice: "予約確定をしました。"
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_time, :course, :comment, :reservation_time, :guest_id)
  end
end
