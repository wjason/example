module TencentCloudHelper
  def upload_image_to_cos(file)
    require 'rest-client'

    # 腾讯云 COS 配置信息
    tencent_cloud_creds = Rails.application.credentials.tencent_cloud_cos
    secret_id = tencent_cloud_creds[:secret_id]
    secret_key = tencent_cloud_creds[:secret_key]
    region = 'ap-guangzhou' # 例如：'ap-beijing'
    bucket_name = 'dy-1304952191' # 存储桶名称
    cos_path = "/uploads/#{SecureRandom.hex(10)}#{File.extname(file.original_filename)}" # 存储路径，可以根据需求修改

    # 构建 COS API 请求 URL
    endpoint = "https://#{bucket_name}.cos.#{region}.myqcloud.com#{cos_path}"
    request_url = "https://#{bucket_name}.cos.#{region}.myqcloud.com#{cos_path}"

    # 构建请求头
    headers = {
      # 'User-Agent' => 'YourAppName', # 替换为你的应用名
      'Host' => "#{bucket_name}.cos.#{region}.myqcloud.com"
    }

    # 构建签名
    timestamp = Time.now.to_i
    auth_string = "a=#{secret_id}&b=#{bucket_name}&k=#{secret_key}&t=#{timestamp}&e=#{timestamp + 3600}&r=#{SecureRandom.hex(8)}&f="
    hmac = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), secret_key, auth_string)
    sign = Base64.encode64(hmac).strip

    # 发送 PUT 请求上传文件
    RestClient.put(
      request_url,
      file.read,
      headers: headers.merge(
        'Authorization' => sign,
        'Content-Type' => 'application/octet-stream'
      )
    )

    # 返回上传后的图片在 COS 中的访问路径
    return endpoint
  end
end
