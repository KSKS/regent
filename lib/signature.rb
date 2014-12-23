#tested under ruby 1.9.2
#gem install ruby-hmac
require 'hmac-sha1'
require 'base64'

def make_signature(uri_path, params, client_id, secret)
  padding_factor = (4 - secret.length % 4) % 4
  secret += "=" * padding_factor
  secret = secret.gsub(/[-_]/, {"-" => "+", "_" => "/"})
  binary_key = Base64.decode64(secret)
  
  params.update({"client" => client_id})
  path = uri_path + "?" + params.collect{|k,v| "#{k}=#{v}"}.inject{|initial,cur| initial + "&" + cur}
  
  digest = HMAC::SHA1.new(binary_key).update(path).digest
  digest = Base64.encode64(digest).gsub(/[+\/]/, {"+" => "-", "/" => "_"}).delete("=")
  return "#{path}&sig=#{digest}"
end

puts 'http://api.singleplatform.co' + make_signature('/locations/regent-bakery-and-cafe/menu', {}, "c3sbrpbtkbs5gverurfkxpemc", "PkkJXNRpO2l0r5u6u0PlCNme1KA8akGejMIjHI5Gkj8")

