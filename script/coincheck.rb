require "openssl"

nonce = Time.now.to_i.to_s
url = "https://coincheck.com/api/accounts/balance"
body = "hoge=foo"
message = nonce + url + body
secret = "API_SECRET"
OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), secret, message)
