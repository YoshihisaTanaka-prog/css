class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  protect_from_forgery except: [:create, :update, :destroy]
  before_action -> {only_admin_or_api 10}, only: [:create, :update, :destroy]

  # GET /products or /products.json
  def index
    @products = Product.where(user_id: session[:user_id])
    @user = User.find(session[:user_id])
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    test_product = Product.find_by(name: @product.name, user_id: @product.user_id)
    if test_product
      respond_to do |format|
        format.html { redirect_to product_url(test_product), notice: "Product has already been created." }
        format.json { 
          data = {}
          data[test_product.id] = test_product.hash_format
          render json: data
        }
      end
    else
      respond_to do |format|
        if @product.save
          format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
          format.json { 
            data = {}
            data[@product.id] = @product.hash_format
            render json: data
          }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      kept_user_id = @product.user_id
      if @product.update(product_params)
        @product.user_id = kept_user_id
        @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
      session[:product_id] = params[:id]
    end

    # Only allow a list of trusted parameters through.
    def product_params
      logger.debug params[:product]
      if params[:product].class == String then
        dummy_param = {}
        dummy_param[:product] = hashed_params params[:product]
        return dummy_param.require(:product).permit(:name, :user_id)
      else
        return params.require(:product).permit(:name, :user_id)
      end
    end
end
