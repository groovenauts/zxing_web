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
    fn = f.is_a?(String) ? f : f[:filename]
    io = f.is_a?(String) ? f : f[:tempfile]
    {
      :filename => fn,
      :result => ZXing.decode(io)
    }
  end
  JSON.generate(results)
end
