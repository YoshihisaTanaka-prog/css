class ValuesController < ApplicationController
  before_action :set_value, only: %i[ show edit update destroy ]

  # GET /values or /values.json
  def index
    @values = Value.all
  end

  # GET /values/1 or /values/1.json
  def show
  end

  # GET /values/new
  def new
    @value = Value.new
  end

  # GET /values/1/edit
  def edit
  end

  # POST /values or /values.json
  def create
    @value = Value.new(value_params)
    test = Value.find_by(original_tag_id: @value.original_tag_id, title_id: @value.title_id)

    if test
      respond_to do |format|
        format.html { redirect_to value_url(test), notice: "Value was successfully created." }
        format.json {
          data = {test.id: test.hash_format}
          render json: data
        }
      end
    else
      respond_to do |format|
        if @value.save
          format.html { redirect_to value_url(@value), notice: "Value was successfully created." }
          format.json {
            data = {@value.id: @value.hash_format}
            render json: data
          }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @value.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /values/1 or /values/1.json
  def update
    respond_to do |format|
      kept_original_tag_id = @value.original_tag_id
      if @value.update(value_params)
        @value.original_tag_id = kept_original_tag_id
        @value.save
        format.html { redirect_to value_url(@value), notice: "Value was successfully updated." }
        format.json {
          data = {@value.id: @value.hash_format}
          render json: data
        }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /values/1 or /values/1.json
  def destroy
    @value.destroy

    respond_to do |format|
      format.html { redirect_to values_url, notice: "Value was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_value
      @value = Value.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def value_params
      params.require(:value).permit(:original_tag_id, :title_id, :value)
    end
end
