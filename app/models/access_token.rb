class AccessToken < ApplicationRecord
  include HTTParty

  def self.get_or_refresh_token
    token = AccessToken.find_or_initialize_by(id:1)

    #如果token不存在或者过期，刷新token
    if token.expired? || token.token.blank?
      response = fetch_new_token
      if response['access_token'].present?
        token.token = response['access_token']
        token.expires_at = Time.new + response['expires_in'].to_i.seconds
        token.save
      else
        raise 'Failed to fetch new access_token'
      end
    end
    token.token
  end

  #检查token是否过期
  def expired?
    expires_at.nil? || expires_at < Time.now
  end

  private
  def self.fetch_new_token
    url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx6594727fb2e295e6&secret=b07820d9ded8d431ba103948b011fc77"
    response = HTTParty.get(url)
    JSON.parse(response.body)
  end
end
