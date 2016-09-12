# coding: utf-8
require 'sinatra'
require 'zxing'

get '/' do
  "working!"
end

post '/decode' do
  files = params[:file]
  files = [files] unless files.is_a?(Array)
  results = files.map do |f|
    ZXing.decode(f[:tempfile])
  end
  results.join("\n")
end
