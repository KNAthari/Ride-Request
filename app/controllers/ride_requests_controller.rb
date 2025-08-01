class RideRequestsController < ApplicationController
  before_action :set_ride_request, only: %i[ show edit update destroy ]

  # GET /ride_requests or /ride_requests.json
  def index
    @ride_requests = RideRequest.all
  end

  # GET /ride_requests/1 or /ride_requests/1.json
  def show
  end

  # GET /ride_requests/new
  def new
    @ride_request = RideRequest.new
  end

  # GET /ride_requests/1/edit
  def edit
  end

  # POST /ride_requests or /ride_requests.json
  def create
    @ride_request = RideRequest.new(ride_request_params)

    respond_to do |format|
      if @ride_request.save
        format.html { redirect_to @ride_request, notice: "Ride request was successfully created." }
        format.json { render :show, status: :created, location: @ride_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ride_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ride_requests/1 or /ride_requests/1.json
  def update
    respond_to do |format|
      if @ride_request.update(ride_request_params)
        format.html { redirect_to @ride_request, notice: "Ride request was successfully updated." }
        format.json { render :show, status: :ok, location: @ride_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ride_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ride_requests/1 or /ride_requests/1.json
  def destroy
    @ride_request.destroy!

    respond_to do |format|
      format.html { redirect_to ride_requests_path, status: :see_other, notice: "Ride request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride_request
      @ride_request = RideRequest.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def ride_request_params
      params.expect(ride_request: [ :name, :email, :pickup_time, :location, :notes ])
    end
end
