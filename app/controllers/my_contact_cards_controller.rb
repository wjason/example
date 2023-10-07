class MyContactCardsController < ApplicationController
  include TencentCloudHelper


  # GET /my_contact_cards or /my_contact_cards.json
  def index
    #校验下是不是存在了
    @my_contact_card = MyContactCard.find_by(code: params[:code])
    if @my_contact_card
      @link = "http://xurl.xcoze.com/dy/" + @my_contact_card.code
    else
      @link = "系统错误，请联系管理员"
    end

  end

  # GET /my_contact_cards/1 or /my_contact_cards/1.json
  def show
    @my_contact_card = MyContactCard.find_by(code: params[:id])
    @my_contact_card.URLScheme = ""
    access_token = AccessToken.get_or_refresh_token(false )
    # 构建请求参数
    request_payload = {
      jump_wxa: {
        path: "/pages/addUser/index",
        query: "code=#{@my_contact_card.code}",
        env_version: "release"
      },
      # path: "/pages/addUser/index",
      # query: "code=#{@my_contact_card.code}",
      expire_type: 1,
      expire_interval: 30
    }
    response = RestClient.post(
      "https://api.weixin.qq.com/wxa/generatescheme?access_token=#{access_token}",
      # "https://api.weixin.qq.com/wxa/generate_urllink?access_token=#{access_token}",
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
    elsif response_data['errcode'] == 40001
      AccessToken.get_or_refresh_token(true )
      p "触发强制刷新ACCESS_TOKEN"
      logger.warn("触发强制刷新ACCESS_TOKEN")
      redirect_to my_contact_card_path(id: params[:id], format: :json)
    else
      # 请求失败，返回errcode参数
      # render json: { errcode: response_data['errcode'] }, status: :unprocessable_entity
      @my_contact_card.URLScheme = "errorCode#{response_data['errcode']}"
    end
  end



  def new
    @my_contact_card = MyContactCard.new
  end
  def create
    @my_contact_card = MyContactCard.new(my_contact_card_params)
    if @my_contact_card.save
      # 上传图片到腾讯云 COS
      if params[:my_contact_card][:avatar]
        @my_contact_card.avatar = upload_image_to_cos(params[:my_contact_card][:avatar])
      end

      if params[:my_contact_card][:QRcode]
        @my_contact_card.QRcode = upload_image_to_cos(params[:my_contact_card][:QRcode])
      end

      if params[:my_contact_card][:cpic]
        @my_contact_card.cpic = upload_image_to_cos(params[:my_contact_card][:cpic])
      end

      # 保存模型
      if @my_contact_card.save
        redirect_to my_contact_cards_path(code: @my_contact_card.code)
      else
        render 'new'
      end
    else
      render 'new'
    end
  end



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
