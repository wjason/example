class DyController < ApplicationController
  layout "dy_layout"
  def show
    p params[:id]
    @card = MyContactCard.find_by(code: params[:id])
    @cardsche = ""
    access_token = AccessToken.get_or_refresh_token(false )
    # 构建请求参数
    request_payload = {
      # jump_wxa: {
      #   path: "/pages/addUser/index",
      #   query: "code=#{params[:id]}",
      #   env_version: "release"
      # },
      path: "/pages/addUser/index",
      query: "code=#{params[:id]}",
      expire_type: 1,
      expire_interval: 30
    }
    response = RestClient.post(
      "https://api.weixin.qq.com/wxa/generate_urllink?access_token=#{access_token}",
      request_payload.to_json,
      content_type: :json,
      accept: :json
    )
    # 处理响应
    response_data = JSON.parse(response.body)
    if response_data['errcode'] == 0
      # 请求成功，返回openlink参数
      # render json: { openlink: response_data['openlink'] }, status: :ok
      @cardsche = response_data['url_link']
    elsif response_data['errcode'] == 40001
      AccessToken.get_or_refresh_token(true )
      p "触发强制刷新ACCESS_TOKEN"
      logger.warn("触发强制刷新ACCESS_TOKEN")
    else
      # 请求失败，返回errcode参数
      # render json: { errcode: response_data['errcode'] }, status: :unprocessable_entity
      @cardsche = "errorCode#{response_data['errcode']}"
    end

    p @cardsche

    # redirect_to @cardsche, allow_other_host: true

  end
end
