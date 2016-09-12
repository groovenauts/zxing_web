# coding: utf-8
require 'sinatra'
require 'zxing'
require 'json'

get '/' do
  "working!"
end

post '/decode' do
  files = params[:file]
  files = [files] unless files.is_a?(Array)
  results = files.map do |f|
    {
      :filename => f[:filename],
      :result => ZXing.decode(f[:tempfile])
    }
  end
  JSON.generate(results)
end
