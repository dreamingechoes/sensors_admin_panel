class SensorsController < ApplicationController
  before_action :set_sensor, only: [:show, :edit, :update, :destroy]

  # GET /sensors
  # GET /sensors.json
  def index
    @sensors = Sensor.all
  end

  # GET /sensors/1
  # GET /sensors/1.json
  def show
    @sensor_measures = @sensor.measures.order('created_at desc').limit(10)
                              .map{|m| { time: m.created_at,
                                         value: m.value } }
  end

  # GET /sensors/new
  def new
    @sensor = Sensor.new
  end

  # GET /sensors/1/edit
  def edit
  end

  # POST /sensors
  # POST /sensors.json
  def create
    @sensor = Sensor.new(sensor_params)

    respond_to do |format|
      if @sensor.save
        format.html { redirect_to @sensor, notice: 'Sensor was successfully created.' }
        format.json { render :show, status: :created, location: @sensor }
      else
        format.html { render :new }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sensors/1
  # PATCH/PUT /sensors/1.json
  def update
    respond_to do |format|
      if @sensor.update(sensor_params)
        format.html { redirect_to @sensor, notice: 'Sensor was successfully updated.' }
        format.json { render :show, status: :ok, location: @sensor }
      else
        format.html { render :edit }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sensors/1
  # DELETE /sensors/1.json
  def destroy
    @sensor.destroy
    respond_to do |format|
      format.html { redirect_to sensors_url, notice: 'Sensor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor
      @sensor = Sensor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_params
      params.require(:sensor).permit(:name, :description, :kind)
    end
end
