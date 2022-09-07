class OriginalTagsController < ApplicationController
  before_action :set_original_tag, only: %i[ show edit update destroy ]
  protect_from_forgery except: [:create, :update, :destroy]
  before_action -> {only_admin_or_api 10}, only: [:create, :update, :destroy]

  # GET /original_tags or /original_tags.json
  def index
    @original_tags = OriginalTag.where(product_id: session[:product_id])
    @product = Product.find_by_id(session[:product_id])
  end

  # GET /original_tags/1 or /original_tags/1.json
  def show
  end

  # GET /original_tags/new
  def new
    @original_tag = OriginalTag.new
  end

  # GET /original_tags/1/edit
  def edit
  end

  # POST /original_tags or /original_tags.json
  def create
    @original_tag = OriginalTag.new(original_tag_params)

    name_list = original_tag_params[:name].split(' ')
    if name_list.length > 1
      logger.debug name_list
      parent_name = ""
      for i in 0..(name_list.length - 2)
        parent_name = parent_name + name_list[i]
      end
      logger.debug parent_name
      parent = OriginalTag.find_by(name: parent_name)
      if parent
        @original_tag.parent_id = parent.id
      end
    end

    respond_to do |format|
      if @original_tag.save
        format.html { redirect_to original_tag_url(@original_tag), notice: "Original tag was successfully created." }
        format.json { render json:, @original_tag.hash_format }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @original_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /original_tags/1 or /original_tags/1.json
  def update
    respond_to do |format|
      kept_product_id = @original_tag.product_id
      kept_parent_id = @original_tag.parent_id
      if @original_tag.update(original_tag_params)
        @original_tag.product_id = kept_product_id
        @original_tag.parent_id = kept_parent_id
        @original_tag.save
        format.html { redirect_to original_tag_url(@original_tag), notice: "Original tag was successfully updated." }
        format.json { render json:, @original_tag.hash_format }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @original_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /original_tags/1 or /original_tags/1.json
  def destroy
    @original_tag.destroy

    respond_to do |format|
      format.html { redirect_to original_tags_url, notice: "Original tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_original_tag
      @original_tag = OriginalTag.find(params[:id])
      session[:original_tag_id] = params[:id]
    end

    # Only allow a list of trusted parameters through.
    def original_tag_params
      if params[:original_tag].class == String then
        dummy_param = {}
        params[:original_tag] = hashed_params params[:original_tag]
        return params.require(:original_tag).permit(:product_id, :name, :parent_id)
      else
        return params.require(:original_tag).permit(:product_id, :name, :parent_id)
      end
    end
end
