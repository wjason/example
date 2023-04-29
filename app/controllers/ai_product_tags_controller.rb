class AiProductTagsController < ApplicationController
  before_action :set_ai_product_tag, only: %i[ show edit update destroy ]

  # GET /ai_product_tags or /ai_product_tags.json
  def index
    @ai_product_tags = AiProductTag.all
  end

  # GET /ai_product_tags/1 or /ai_product_tags/1.json
  def show
  end

  # GET /ai_product_tags/new
  def new
    @ai_product_tag = AiProductTag.new
  end

  # GET /ai_product_tags/1/edit
  def edit
  end

  # POST /ai_product_tags or /ai_product_tags.json
  def create
    @ai_product_tag = AiProductTag.new(ai_product_tag_params)

    respond_to do |format|
      if @ai_product_tag.save
        format.html { redirect_to ai_product_tag_url(@ai_product_tag), notice: "Ai product tag was successfully created." }
        format.json { render :show, status: :created, location: @ai_product_tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ai_product_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ai_product_tags/1 or /ai_product_tags/1.json
  def update
    respond_to do |format|
      if @ai_product_tag.update(ai_product_tag_params)
        format.html { redirect_to ai_product_tag_url(@ai_product_tag), notice: "Ai product tag was successfully updated." }
        format.json { render :show, status: :ok, location: @ai_product_tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ai_product_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ai_product_tags/1 or /ai_product_tags/1.json
  def destroy
    @ai_product_tag.destroy

    respond_to do |format|
      format.html { redirect_to ai_product_tags_url, notice: "Ai product tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ai_product_tag
      @ai_product_tag = AiProductTag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ai_product_tag_params
      params.require(:ai_product_tag).permit(:name, :ai_product_id)
    end
end
