class TitlesController < ApplicationController
  before_action :set_title, only: %i[ show edit update destroy ]
  after_action :fetch_main_cache_data, only: [:create, :update, :destroy]

  # GET /titles or /titles.json
  def index
    @titles = Title.all.order(:name)
  end

  # GET /titles/1 or /titles/1.json
  def show
  end

  # GET /titles/new
  def new
    @title = Title.new
  end

  # GET /titles/1/edit
  def edit
  end

  # POST /titles or /titles.json
  def create
    @title = Title.new(title_params)

    respond_to do |format|
      if @title.save_and_set(params[:category_list])
        format.html { redirect_to title_url(@title), notice: "Title was successfully created." }
        format.json { render :show, status: :created, location: @title }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /titles/1 or /titles/1.json
  def update
    respond_to do |format|
      if @title.update_and_set(title_params, params[:category_list])
        format.html { redirect_to title_url(@title), notice: "Title was successfully updated." }
        format.json { render :show, status: :ok, location: @title }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titles/1 or /titles/1.json
  def destroy
    @title.destroy

    respond_to do |format|
      format.html { redirect_to titles_url, notice: "Title was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_title
      @title = Title.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def title_params
      params.require(:title).permit(:name, :operation_id)
    end
end
