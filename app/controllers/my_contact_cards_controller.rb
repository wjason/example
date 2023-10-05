class MyContactCardsController < ApplicationController
  # require 'rest-client'
  # before_action :set_my_contact_card, only: %i[ show ]

  # GET /my_contact_cards or /my_contact_cards.json
  # def index
  #   @my_contact_cards = MyContactCard.all
  # end

  # GET /my_contact_cards/1 or /my_contact_cards/1.json
  def show
    @my_contact_card = MyContactCard.find_by(code: params[:id])
    @my_contact_card.URLScheme = ""
    access_token = AccessToken.get_or_refresh_token
    # 构建请求参数
    request_payload = {
      jump_wxa: {
        path: "/pages/addUser/index",
        query: "code=#{@my_contact_card.code}",
        env_version: "release"
      },
      expire_type: 1,
      expire_interval: 30
    }
    response = RestClient.post(
      "https://api.weixin.qq.com/wxa/generatescheme?access_token=#{access_token}",
      request_payload.to_json,
      content_type: :json,
      accept: :json
    )
    # 处理响应
    response_data = JSON.parse(response.body)
    if response_data['errcode'] == 0
      # 请求成功，返回openlink参数
      # render json: { openlink: response_data['openlink'] }, status: :ok
      @my_contact_card.URLScheme = response_data['openlink']
    else
      # 请求失败，返回errcode参数
      # render json: { errcode: response_data['errcode'] }, status: :unprocessable_entity
      @my_contact_card.URLScheme = "errorCode#{response_data['errcode']}"
    end



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
      params.require(:my_contact_card).permit(:avatar, :title, :QRcode, :code, :ctitle, :cpic, :cdescription)
    end

  # def generate_scheme(code)
  #   access_token = AccessToken.get_or_refresh_token
  # end
end
