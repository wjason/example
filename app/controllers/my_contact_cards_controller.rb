class MyContactCardsController < ApplicationController
  before_action :set_my_contact_card, only: %i[ show ]

  # GET /my_contact_cards or /my_contact_cards.json
  # def index
  #   @my_contact_cards = MyContactCard.all
  # end

  # GET /my_contact_cards/1 or /my_contact_cards/1.json
  def show
  end

  # GET /my_contact_cards/new
  # def new
  #   @my_contact_card = MyContactCard.new
  # end

  # GET /my_contact_cards/1/edit
  # def edit
  # end

  # POST /my_contact_cards or /my_contact_cards.json
  # def create
  #   @my_contact_card = MyContactCard.new(my_contact_card_params)
  #
  #   respond_to do |format|
  #     if @my_contact_card.save
  #       format.html { redirect_to my_contact_card_url(@my_contact_card), notice: "My contact card was successfully created." }
  #       format.json { render :show, status: :created, location: @my_contact_card }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @my_contact_card.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /my_contact_cards/1 or /my_contact_cards/1.json
  # def update
  #   respond_to do |format|
  #     if @my_contact_card.update(my_contact_card_params)
  #       format.html { redirect_to my_contact_card_url(@my_contact_card), notice: "My contact card was successfully updated." }
  #       format.json { render :show, status: :ok, location: @my_contact_card }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @my_contact_card.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /my_contact_cards/1 or /my_contact_cards/1.json
  # def destroy
  #   @my_contact_card.destroy
  #
  #   respond_to do |format|
  #     format.html { redirect_to my_contact_cards_url, notice: "My contact card was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_contact_card
      @my_contact_card = MyContactCard.find_by(code: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def my_contact_card_params
      params.require(:my_contact_card).permit(:avatar, :title, :QRcode, :code)
    end
end
