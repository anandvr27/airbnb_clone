class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy], except: :trip
  before_action :authenticate_user!

  # GET /reservations
  # GET /reservations.json
  def index
    # @reservations = Reservation.all
    #current_user.reservations.where('room_id = ?', params[:room_id])
    @reservations = Reservation.all
   # respond_with @bookings
  end

  def trip
    @reservations = current_user.reservations
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    # binding.pry
    @listing = Listing.find(params[:listing_id])
    # @reservation = Reservation.new
    @reservation = @listing.reservations.build
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    # binding.pry
    @listing = params[:listing_id]
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    # binding.pry
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to listings_path, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:listing_id, :start_date, :end_date)
    end
end
