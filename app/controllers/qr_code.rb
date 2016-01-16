require 'unirest'
require 'base64'

get '/qr_code/:profile_id' do
  user_profile = User.find_by(slug: params[:profile_id])
  content_string = "#{user_profile.first_name} #{user_profile.last_name}, #{user_profile.age}, #{user_profile.bio}"
  response = Unirest.post "https://neutrinoapi-qr-code.p.mashape.com/qr-code",
  headers:{
    "X-Mashape-Key" => "cNsWL6qxOSmshKTfrfK9qAc4Iij6p1ylJmTjsnkTMyeWjpfz9R",
    "Content-Type" => "application/x-www-form-urlencoded"
  },
  parameters:{
    "bg-color" => "#ffffff",
    "content" => "#{content_string}",
    "fg-color" => "#000000",
    "height" => 128,
    "width" => 128
  }
  qr_img = Base64.encode64(response.body)
  puts "========================================================"
  puts "#{qr_img}"
  puts "========================================================"
  if request.xhr?
    {id: user_profile.id, img: qr_img}.to_json
  end
end
