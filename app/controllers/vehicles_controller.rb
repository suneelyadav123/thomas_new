class VehiclesController < ApplicationController
  before_action :set_vehicle, except: [:index]

  def index 
    @vehicles = current_user.vehicles.all.order(:driver_name)
  end

  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = current_user.vehicles.new(vehicle_params)

    respond_to do |format|
      binding.pry
      if @vehicle.save
        format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehcile }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehcile.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle ||= Vehicle.find_by_id(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vehicle_params
    params.fetch(:vehicle, {}).permit(:driver_name, :driver_phone_num, :vehicle_num, :license_num, :address_line1, :address_line2, :city, :state, :pincode,:identity_proof,:identity_num)
  end

end
