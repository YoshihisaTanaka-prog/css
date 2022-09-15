class UnitsController < ApplicationController
  before_action :set_unit, only: %i[ show edit update destroy ]
  after_action :fetch_main_cache_data, only: [:create, :update, :destroy]

  # GET /units or /units.json
  def index
    @units = Unit.all.order(:name)
  end

  # GET /units/1 or /units/1.json
  def show
  end

  # GET /units/new
  def new
    @unit = Unit.new
  end

  # GET /units/1/edit
  def edit
  end

  # POST /units or /units.json
  def create
    logger.debug params
    @unit = Unit.new(unit_params)
    test = Unit.find_by(name: @unit.name)
    if test
      operation_id_list = test.operation_id_list + params[:operations]
      respond_to do |format|
        if test.save_and_set operation_id_list
          format.html { redirect_to unit_url(test), notice: "Unit was successfully updated." }
          format.json { render :show, status: :created, location: test }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: test.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @unit.save_and_set params[:operations]
          format.html { redirect_to unit_url(@unit), notice: "Unit was successfully created." }
          format.json { render :show, status: :created, location: @unit }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @unit.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /units/1 or /units/1.json
  def update
    logger.debug params
    respond_to do |format|
      if @unit.update_and_set(unit_params, params[:operations])
        format.html { redirect_to unit_url(@unit), notice: "Unit was successfully updated." }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1 or /units/1.json
  def destroy
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to units_url, notice: "Unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unit_params
      params.require(:unit).permit(:name)
    end
end
