class AiProductSortsController < ApplicationController
  before_action :set_ai_product_sort, only: %i[ show edit update destroy ]

  # GET /ai_product_sorts or /ai_product_sorts.json
  def index
    @ai_product_sorts = AiProductSort.all
  end

  # GET /ai_product_sorts/1 or /ai_product_sorts/1.json
  def show
  end

  # GET /ai_product_sorts/new
  def new
    @ai_product_sort = AiProductSort.new
  end

  # GET /ai_product_sorts/1/edit
  def edit
  end

  # POST /ai_product_sorts or /ai_product_sorts.json
  def create
    @ai_product_sort = AiProductSort.new(ai_product_sort_params)

    respond_to do |format|
      if @ai_product_sort.save
        format.html { redirect_to ai_product_sort_url(@ai_product_sort), notice: "Ai product sort was successfully created." }
        format.json { render :show, status: :created, location: @ai_product_sort }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ai_product_sort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ai_product_sorts/1 or /ai_product_sorts/1.json
  def update
    respond_to do |format|
      if @ai_product_sort.update(ai_product_sort_params)
        format.html { redirect_to ai_product_sort_url(@ai_product_sort), notice: "Ai product sort was successfully updated." }
        format.json { render :show, status: :ok, location: @ai_product_sort }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ai_product_sort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ai_product_sorts/1 or /ai_product_sorts/1.json
  def destroy
    @ai_product_sort.destroy

    respond_to do |format|
      format.html { redirect_to ai_product_sorts_url, notice: "Ai product sort was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ai_product_sort
      @ai_product_sort = AiProductSort.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ai_product_sort_params
      params.require(:ai_product_sort).permit(:name, :uuid, :weight)
    end
end
