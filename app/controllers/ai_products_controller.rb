class AiProductsController < ApplicationController
  before_action :set_ai_product, only: %i[ show edit update destroy ]

  # GET /ai_products or /ai_products.json
  def index
    @ai_products = AiProduct.all
    @ai_product_sorts = AiProductSort.all.order("weight DESC")
  end

  # GET /ai_products/1 or /ai_products/1.json
  def show
    @likeness = @ai_product.ai_product_sort.ai_products.limit(12)
  end

  # GET /ai_products/new
  def new
    @ai_product = AiProduct.new
  end

  # GET /ai_products/1/edit
  def edit
  end

  # POST /ai_products or /ai_products.json
  def create
    @ai_product = AiProduct.new(ai_product_params)

    respond_to do |format|
      if @ai_product.save
        format.html { redirect_to ai_product_url(@ai_product), notice: "Ai product was successfully created." }
        format.json { render :show, status: :created, location: @ai_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ai_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ai_products/1 or /ai_products/1.json
  def update
    respond_to do |format|
      if @ai_product.update(ai_product_params)
        format.html { redirect_to ai_product_url(@ai_product), notice: "Ai product was successfully updated." }
        format.json { render :show, status: :ok, location: @ai_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ai_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ai_products/1 or /ai_products/1.json
  def destroy
    @ai_product.destroy

    respond_to do |format|
      format.html { redirect_to ai_products_url, notice: "Ai product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ai_product
      @ai_product = AiProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ai_product_params
      params.require(:ai_product).permit(:uuid, :name, :des, :intro, :cover, :uri, :uri, :company, :country, :weight, :ai_product_sort)
    end
end
