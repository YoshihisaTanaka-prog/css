class NormalTagsController < ApplicationController
  before_action :set_normal_tag, only: %i[ show edit update destroy ]

  # GET /normal_tags or /normal_tags.json
  def index
    @normal_tags = NormalTag.all.order(:name)
  end

  # GET /normal_tags/1 or /normal_tags/1.json
  def show
  end

  # GET /normal_tags/new
  def new
    @normal_tag = NormalTag.new
  end

  # GET /normal_tags/1/edit
  def edit
  end

  # POST /normal_tags or /normal_tags.json
  def create
    @normal_tag = NormalTag.new(normal_tag_params)

    respond_to do |format|
      if @normal_tag.save
        format.html { redirect_to normal_tag_url(@normal_tag), notice: "Normal tag was successfully created." }
        format.json { render :show, status: :created, location: @normal_tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @normal_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /normal_tags/1 or /normal_tags/1.json
  def update
    respond_to do |format|
      if @normal_tag.update(normal_tag_params)
        format.html { redirect_to normal_tag_url(@normal_tag), notice: "Normal tag was successfully updated." }
        format.json { render :show, status: :ok, location: @normal_tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @normal_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /normal_tags/1 or /normal_tags/1.json
  def destroy
    @normal_tag.destroy

    respond_to do |format|
      format.html { redirect_to normal_tags_url, notice: "Normal tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_normal_tag
      @normal_tag = NormalTag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def normal_tag_params
      params.require(:normal_tag).permit(:name)
    end
end
